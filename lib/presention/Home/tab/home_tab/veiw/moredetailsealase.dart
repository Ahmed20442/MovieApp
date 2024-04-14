import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/DI/di.dart';
import 'package:movie_app/core/utils/strings_manager.dart';
import 'package:movie_app/domain/entity/realseentity/Realserntity.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetRelase/realsewidget.dart';

class MoreDetailsRelse extends StatelessWidget {
  final Realserntity relse;
  final List<Realserntity> list;

  const MoreDetailsRelse({Key? key, required this.relse, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            relse.title?? "",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocProvider(
          create: (context) => getIt<PopularViewModel>(),
          child: Padding(
            padding: REdgeInsets.all(5.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child:Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  "https://image.tmdb.org/t/p/w500/${relse.posterPath}",
                                  fit: BoxFit.fill,
                                  width: double.infinity,
                                  height: 300.h,
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black.withOpacity(0.6),
                                      ),
                                      child: Icon(Icons.play_arrow, color: Colors.white, size: 80.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${relse.title ?? ""}",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.sp,color: Colors.white),
                                ),
                              ],
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${relse.releaseDate ?? ""}",
                                  style: TextStyle(fontSize: 12,color: Colors.white),
                                ),
                                SizedBox(width: 15,),
                                Text(
                                  "${relse.popularity  ?? ""}",
                                  style: TextStyle(fontSize: 12,color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 25.h,),
                            Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Image.network(
                                        "https://image.tmdb.org/t/p/w500/${relse.posterPath}",
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned.fill(
                                        child: Align(
                                            alignment: Alignment.topLeft,
                                            child:  Container(

                                                decoration: BoxDecoration
                                                  (image: DecorationImage(image: AssetImage("assets/images/Icon awesome-bookmark.png")),),
                                                child: Icon(Icons.add,color: Colors.white,size: 35.sp,))
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12.w,),
                                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Text('''${relse.overview}'''??"",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white)),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.amber,size: 24.sp,),
                                      SizedBox(width: 10.w,),
                                      Text("${relse.voteAverage}",style: TextStyle(color: Colors.white,fontSize: 24.sp)),
                                    ],
                                  )
                                ],)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 320.h,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            StringsManager.Similar,
                            style: TextStyle(color: Colors.white, fontSize: 30.sp),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: REdgeInsets.all(5),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                RealseWidget(realse: list[index]),
                            itemCount: list.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                SizedBox(width: 10.w),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        )
    );
  }
}