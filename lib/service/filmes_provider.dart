import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:filmes_app/class/filmes.dart';

import '../base_url.dart';

class FilmesProvider extends ChangeNotifier {
  FilmesProvider.init() {
    _categoria = 'Filmes Populares';
    _indexPage = 0;
    getFilmes(page: '1');
    getTV(page: '1');
  }

  // navegacao entre paginas
  int _indexPage;

  get indexPage => _indexPage;

  void criarindexPage(int index) {
    _indexPage = index;
    notifyListeners();
  }

  //escolher a categoria
  String _categoria;

  get categoria => _categoria;

  void criarCategoria({String categoria}) {
    _categoria = categoria;
    notifyListeners();
  }

  //inicializar o administar o getfilmes
  List<Filmes> _filmes;

  List<Filmes> get devolverFilmes {
    return _filmes;
  }

  void criarFilmes({List<Filmes> filmes}) {
    _filmes = filmes;
    notifyListeners();
  }

  //inicializar o administar o getTv

  List<Filmes> _tv;

  List<Filmes> get devolverTv {
    return _tv;
  }

  void criarTv({List<Filmes> tv}) {
    _tv = tv;
    notifyListeners();
  }

  //criar e adiministar lista de favoritos

  List<Filmes> _listaFavoritos = [];

  get listaFavoritos => _listaFavoritos;

  void criarListaFavoritos(Filmes filmesAdicionado) {
    _listaFavoritos.add(filmesAdicionado);
    notifyListeners();
  }

  void retirarListaFavoritos(Filmes filmesAdicionado) {
    _listaFavoritos.remove(filmesAdicionado);
    notifyListeners();
  }

  Future<List<Filmes>> getFilmes({String page}) async {
    try {
      Response response = await Dio().get(
        baseUrl +
            '/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&page=$page',
      );

      final json = response.data['results'];

      String mediaType = 'movie';

      List<Filmes> filmes = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson, mediaType))
          .toList();

      criarFilmes(filmes: filmes);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<Filmes>> getTV({String page}) async {
    try {
      Response response = await Dio().get(
        baseUrl +
            '/tv/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&page=$page',
      );

      final json = response.data['results'];

      String mediaType = 'tv';

      List<Filmes> filmes = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson, mediaType))
          .toList();

      criarTv(tv: filmes);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
