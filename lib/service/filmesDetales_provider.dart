import 'package:filmes_app/class/fimesDetalhes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FilmesDetalhesProvider extends ChangeNotifier {
  FilmesDetalhes _filmesDetalhes;

  FilmesDetalhes get filmesDetalhes => _filmesDetalhes;

  void escolherFilmesDetalhes({FilmesDetalhes filmesDetalhes}) {
    _filmesDetalhes = filmesDetalhes;
    notifyListeners();
  }

  Future<FilmesDetalhes> getDetalhes({String id}) async {
    try {
      Response response = await Dio().get(
          'https://api.themoviedb.org/3/movie/$id?api_key=d506ee3d7782362d88e5b3e94401251c&language=en-US');

      final json = Map<String, dynamic>.from(response.data);

      FilmesDetalhes filmesDetalhes = FilmesDetalhes.fromJson(json);

      escolherFilmesDetalhes(filmesDetalhes: filmesDetalhes);
    } catch (e) {
      print(e);
    }
  }
}

// FilmesDetalhes filmesDetalhes = json
//     .map<FilmesDetalhes>((filmesJson) => FilmesDetalhes.fromJson(filmesJson))
//     .toList();
