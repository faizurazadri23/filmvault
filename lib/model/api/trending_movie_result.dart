import 'movie.dart';

class TrendingMovieResult{
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  TrendingMovieResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TrendingMovieResult.fromJson(Map<String, dynamic> json) => TrendingMovieResult(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}