class FilmesDetalhes {
  FilmesDetalhes(
      {this.posterPath,
      this.backdropPath,
      this.originalTitle,
      this.overview,
      this.releaseDate,
      this.revenue,
      this.voteAverage});

  factory FilmesDetalhes.fromJson(Map<dynamic, dynamic> json) {
    final backdropPath = json['backdrop_path'].toString();
    final originalTitle = json['original_title'] ?? json['name'].toString();
    final overview = json['overview'].toString();
    final releaseDate =
        json['release_date'] ?? json['first_air_date'].toString();
    final revenue = json['revenue'];
    final voteAverage = json['vote_average'].toString();
    final posterPath = json['poster_path'].toString();

    return FilmesDetalhes(
      backdropPath: backdropPath,
      originalTitle: originalTitle,
      overview: overview,
      releaseDate: releaseDate,
      revenue: revenue == null || revenue == 0 ? '---' : revenue,
      voteAverage: voteAverage,
      posterPath: posterPath,
    );
  }

  final String backdropPath;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final dynamic revenue;
  final String voteAverage;
  final String posterPath;
}
