class FilmesDetalhes {
  FilmesDetalhes(
      {this.poster_path,
      this.backdrop_path,
      this.original_title,
      this.overview,
      this.release_date,
      this.revenue,
      this.vote_average});

  factory FilmesDetalhes.fromJson(Map<dynamic, dynamic> json) {
    final backdrop_path = json['backdrop_path'].toString();
    final original_title = json['original_title'] ?? json['name'].toString();
    final overview = json['overview'].toString();
    final release_date =
        json['release_date'] ?? json['first_air_date'].toString();
    final revenue = json['revenue'];
    final vote_average = json['vote_average'].toString();
    final poster_path = json['poster_path'].toString();

    return FilmesDetalhes(
      backdrop_path: backdrop_path,
      original_title: original_title,
      overview: overview,
      release_date: release_date,
      revenue: revenue == null || revenue == 0 ? '---' : revenue,
      vote_average: vote_average,
      poster_path: poster_path,
    );
  }

  final String backdrop_path;
  final String original_title;
  final String overview;
  final String release_date;
  final dynamic revenue;
  final String vote_average;
  final String poster_path;
}
