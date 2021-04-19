import 'package:filmes_app/class/filmes.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FilmesProvider extends ChangeNotifier {
  // navegacao entre paginas
  int _indexPage;

  get indexPage => _indexPage;

  void criarindexPage(int index) {
    _indexPage = index;
    notifyListeners();
  }

  //escolher a categoria. movie ou tv
  String _categoria;

  get categoria => _categoria;

  void criarCategoria({String categoria}) {
    _categoria = categoria;
    notifyListeners();
  }

  //inicializar o administar o getfilmes
  List<Filmes> _filmes;

  FilmesProvider.init() {
    _categoria = 'Filmes Populares';
    _indexPage = 0;
    getFilmes(movieOrTv: 'movie');
  }

  List<Filmes> get devolverFilmes {
    return _filmes;
  }

  void criarFilmes({List<Filmes> filmes}) {
    _filmes = filmes;
    notifyListeners();
  }

  //criar e adiministar lista de favoritos

  List<Filmes> _listaFavoritos = [];

  get listaFavoritos => _listaFavoritos;

  void criarListaFavoritos(Filmes filmesAdicionado) {
    _listaFavoritos.add(filmesAdicionado);
    print(_listaFavoritos);
    notifyListeners();
  }

  void retirarListaFavoritos(Filmes filmesAdicionado) {
    _listaFavoritos.remove(filmesAdicionado);
    print(_listaFavoritos);
    notifyListeners();
  }

  Future<List<Filmes>> getFilmes({String movieOrTv}) async {
    try {
      Response response = await Dio().get(
        'https://api.themoviedb.org/3/$movieOrTv/popular?api_key=d506ee3d7782362d88e5b3e94401251c&page=1',
      );

      final json = response.data['results'];

      List<Filmes> filmes = json
          .map<Filmes>((filmesJson) => Filmes.fromJson(filmesJson))
          .toList();

      criarFilmes(filmes: filmes);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
