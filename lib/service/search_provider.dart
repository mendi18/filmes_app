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
        'https://api.themoviedb.org/3/search/multi?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&query=$buscar&page=1&include_adult=false',
      );

      final json = response.data['results'];

      //enviar qualquer coisa (nao faz diferenca)
      String media_type = 'o';

      List<Filmes> filmesBuscados = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson, media_type))
          .toList();

      criarFilmesBuscados(filmesBuscados: filmesBuscados);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
