import 'movie.dart';

class TopRatedResult {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  TopRatedResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopRatedResult.fromJson(Map<String, dynamic> json) => TopRatedResult(
        page: json["page"],
        results:
            List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
