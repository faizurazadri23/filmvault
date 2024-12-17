import 'package:filmvault/model/api/movie.dart';

class NowMovieResult{
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  NowMovieResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowMovieResult.fromJson(Map<String, dynamic> json) => NowMovieResult(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}