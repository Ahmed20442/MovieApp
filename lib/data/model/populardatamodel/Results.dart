import 'package:movie_app/domain/entity/popularentity/Popularentity.dart';

/// adult : false
/// backdrop_path : "/xOMo8BRK7PfcJv9JCnx7s5hj0PX.jpg"
/// genre_ids : [878,12]
/// id : 693134
/// original_language : "en"
/// original_title : "Dune: Part Two"
/// overview : "Follow the mythic journey of Paul Atreides as he unites with Chani and the Fremen while on a path of revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the known universe, Paul endeavors to prevent a terrible future only he can foresee."
/// popularity : 4651.845
/// poster_path : "/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg"
/// release_date : "2024-02-27"
/// title : "Dune: Part Two"
/// video : false
/// vote_average : 8.316
/// vote_count : 2680

class Results {
  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview, 
      this.popularity, 
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
      this.voteAverage, 
      this.voteCount,});

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
Results copyWith({  bool? adult,
  String? backdropPath,
  List<int>? genreIds,
  int? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  double? popularity,
  String? posterPath,
  String? releaseDate,
  String? title,
  bool? video,
  double? voteAverage,
  int? voteCount,
}) => Results(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  genreIds: genreIds ?? this.genreIds,
  id: id ?? this.id,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  popularity: popularity ?? this.popularity,
  posterPath: posterPath ?? this.posterPath,
  releaseDate: releaseDate ?? this.releaseDate,
  title: title ?? this.title,
  video: video ?? this.video,
  voteAverage: voteAverage ?? this.voteAverage,
  voteCount: voteCount ?? this.voteCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
  Popularentity toPopularEntity(){
    return Popularentity(
        id: id,title: title,posterPath:posterPath,voteAverage:voteAverage,voteCount:voteCount,overview:overview,
        video:video,releaseDate:releaseDate,popularity:popularity,originalTitle:originalTitle,originalLanguage:originalLanguage,
        genreIds:genreIds,backdropPath:backdropPath,adult:adult
    );
  }


}