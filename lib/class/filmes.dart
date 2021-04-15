class Filmes {
  Filmes({this.title, this.vote_average, this.poster_path});

  factory Filmes.fromJson(Map<String, dynamic> json) {
    final title = json['original_title'] ?? json['original_name'];
    final vote_average = json['vote_average'];
    final poster_path = json['poster_path'];

    return Filmes(
      title: title,
      vote_average: vote_average,
      poster_path: poster_path,
    );
  }

  final String title;
  final dynamic vote_average;
  final String poster_path;
}
