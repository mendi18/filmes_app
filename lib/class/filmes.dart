class Filmes {
  Filmes(
      {this.movieOrTv, this.id, this.title, this.voteAverage, this.posterPath});

  factory Filmes.fromJson(Map<String, dynamic> json, String mediaType) {
    final title = json['original_title'] ?? json['original_name'];
    final voteAverage = json['vote_average'];
    final posterPath = json['poster_path'];
    final id = json['id'];
    final movieOrTv = json['media_type'] ?? mediaType;

    return Filmes(
      title: title,
      voteAverage: voteAverage,
      posterPath: posterPath ?? 'images/image.png',
      id: id,
      movieOrTv: movieOrTv,
    );
  }

  final String title;
  final dynamic voteAverage;
  final String posterPath;
  final dynamic id;
  final String movieOrTv;
}
