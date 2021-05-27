import 'package:filmes_app/class/fimesDetalhes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../base_url.dart';

class FilmesDetalhesProvider extends ChangeNotifier {
  FilmesDetalhes _filmesDetalhes;

  FilmesDetalhes get filmesDetalhes => _filmesDetalhes;

  void escolherFilmesDetalhes({FilmesDetalhes filmesDetalhes}) {
    _filmesDetalhes = filmesDetalhes;
    notifyListeners();
  }

  Future<FilmesDetalhes> getDetalhes({String id, String movieOrtv}) async {
    try {
      Response response = await Dio().get(baseUrl +
          '/$movieOrtv/$id?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US');

      final json = Map<String, dynamic>.from(response.data);

      FilmesDetalhes filmesDetalhes = FilmesDetalhes.fromJson(json);

      escolherFilmesDetalhes(filmesDetalhes: filmesDetalhes);
    } catch (e) {
      print(e);
    }
  }
}
