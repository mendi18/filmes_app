import 'package:filmes_app/class/filmes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FilmesProvider extends ChangeNotifier {
  Future<List<Filmes>> getFilmes() async {
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?api_key=d506ee3d7782362d88e5b3e94401251c&page=1',
      );

      final json = response.data['results'];

      List<Filmes> filmes = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
