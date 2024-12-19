import 'movie.dart';

class UpComingMovieResult{
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  UpComingMovieResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpComingMovieResult.fromJson(Map<String, dynamic> json) => UpComingMovieResult(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}