import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:filmes_app/service/filmes_provider.dart';

class SuperBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filmesProvider = Provider.of<FilmesProvider>(context);
    return BottomNavigationBarTheme(
      data: BottomNavigationBarThemeData(
        backgroundColor: Colors.purple,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.movie_filter_outlined),
            onPressed: () {
              filmesProvider.getFilmes(movieOrTv: 'movie');
              filmesProvider.criarCategoria(categoria: 'Filmes Populares');
              filmesProvider.criarindexPage(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.live_tv_rounded),
            onPressed: () {
              filmesProvider.getFilmes(movieOrTv: 'tv');
              filmesProvider.criarCategoria(categoria: 'Series Populares');
              filmesProvider.criarindexPage(0);
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              filmesProvider.criarCategoria(categoria: 'Favoritos');
              filmesProvider.criarindexPage(2);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, '/searchPage');
            },
          ),
        ],
      ),
    );
  }
}
