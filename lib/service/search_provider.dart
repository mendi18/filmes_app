import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:filmes_app/class/filmes.dart';

class SearchProvider extends ChangeNotifier {
  List<Filmes> _filmesBuscados;

  List<Filmes> get devolverFilmesBuscados => _filmesBuscados;

  void criarFilmesBuscados({List<Filmes> filmesBuscados}) {
    _filmesBuscados = filmesBuscados;
    notifyListeners();
  }

  Future<List<Filmes>> getSearchFilmes({String buscar}) async {
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/search/multi?api_key=d506ee3d7782362d88e5b3e94401251c&language=en-US&query=$buscar&page=1&include_adult=false',
      );

      final json = response.data['results'];

      List<Filmes> filmesBuscados = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson))
          .toList();

      criarFilmesBuscados(filmesBuscados: filmesBuscados);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
