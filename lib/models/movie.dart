class Movie {
  int? id;
  List<int>? genreIds;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      genreIds: json['genre_ids'] is List
          ? List<int>.from(json['genre_ids'])
          : null,
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average']?.toDouble(),
    );
  }
}
