import 'package:filmvault/model/api/movie.dart';

class MovieResult{
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  MovieResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) => MovieResult(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

}