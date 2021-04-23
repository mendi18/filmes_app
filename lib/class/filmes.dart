class Filmes {
  Filmes(
      {this.movieOrTv,
      this.id,
      this.title,
      this.vote_average,
      this.poster_path});

  factory Filmes.fromJson(Map<String, dynamic> json, String media_type) {
    final title = json['original_title'] ?? json['original_name'];
    final vote_average = json['vote_average'];
    final poster_path = json['poster_path'];
    final id = json['id'];
    final movieOrTv = json['media_type'] ?? media_type;

    return Filmes(
      title: title,
      vote_average: vote_average,
      poster_path: poster_path == null ? 'images/image.png' : poster_path,
      id: id,
      movieOrTv: movieOrTv,
    );
  }

  final String title;
  final dynamic vote_average;
  final String poster_path;
  final dynamic id;
  final String movieOrTv;
}
