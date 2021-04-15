import 'package:filmes_app/class/filmes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SearchProvider extends ChangeNotifier {
  Future<List<Filmes>> getSearchFilmes({String buscar}) async {
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/search/multi?api_key=d506ee3d7782362d88e5b3e94401251c&query=$buscar&page=1&include_adult=false',
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
