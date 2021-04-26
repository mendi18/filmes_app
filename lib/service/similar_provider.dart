import 'package:dio/dio.dart';
import 'package:filmes_app/class/filmes.dart';
import 'package:flutter/material.dart';

class SimilarProvider extends ChangeNotifier {
  List<Filmes> _filmesSimilares;

  List<Filmes> get filmesSimilares => _filmesSimilares;

  void criarFilmesSimilares({List<Filmes> filmesSimilares}) {
    _filmesSimilares = filmesSimilares;
    notifyListeners();
  }

  Future<List<Filmes>> getFilmesSimilares({String id, String movieOrTv}) async {
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/$movieOrTv/$id/recommendations?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1',
      );

      final json = response.data['results'];

      String media_type = '$movieOrTv';

      List<Filmes> filmesSimilares = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson, media_type))
          .toList();

      criarFilmesSimilares(filmesSimilares: filmesSimilares);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
