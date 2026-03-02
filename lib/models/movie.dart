class Movie {
  int? id;
  List<int>? genreIds;
  String? title;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  bool isFavorite;
  Movie({
    required this.id,
    required this.genreIds,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.isFavorite,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre_ids': genreIds,
      'title': title,
      'overview': overview,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'isFavorite': isFavorite,
    };
  }

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
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
