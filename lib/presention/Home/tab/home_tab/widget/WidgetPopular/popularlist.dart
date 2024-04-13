import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presention/Home/tab/home_tab/veiwModel/bloc/popularveiwmodel.dart';
import 'package:movie_app/presention/Home/tab/home_tab/widget/WidgetPopular/popularwidget.dart';


class PopularLitWidget extends StatefulWidget {
  const PopularLitWidget({Key? key}) : super(key: key);

  @override
  State<PopularLitWidget> createState() => _CategoriesLitWidgetState();
}

class _CategoriesLitWidgetState extends State<PopularLitWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<PopularViewModel>().GetPopular();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PopularViewModel, HomeTabStates>(
      buildWhen: (prevState , currentState){
        print("build ${currentState}");
        if(currentState is HomeTabLoadingState || currentState is HomeTabErrorState){
          return false;
        }
        return true;
      },
      listenWhen: (prev , currentState){
        if(currentState is HomeTabLoadingState || currentState is HomeTabErrorState || currentState is HomeTabSuccessState){
          return true;
        }
        return false;
      },
      listener: (context, state) {
        print("Listen $state");
        if(state is HomeTabLoadingState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: SizedBox(
                height: 50.h,
                child: Center(child: CircularProgressIndicator(),),
              ),
            );
          },);
        }
        if(state is HomeTabErrorState){
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              content: Text(state.error),
            );
          },);
        }
        if(state is HomeTabSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print(state);
        if(state is HomeTabSuccessState){
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 400.h,
              child: CarouselSlider.builder(
                itemCount: state.categories.length,
                options: CarouselOptions(
                    height: 300.h,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                ),
                itemBuilder: (context, index, index2) =>
                    PopularWidget(popular: state.categories[index],)
              ),
            ),
          );
        }
        return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
      },
    );
  }
}