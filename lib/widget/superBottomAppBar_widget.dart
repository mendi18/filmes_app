import 'package:filmes_app/service/filmes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuperBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final filmesProvider = Provider.of<FilmesProvider>(context);
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.movie_filter_outlined),
            onPressed: () {
              filmesProvider.getFilmes(movieOrTv: 'movie');
              filmesProvider.criarCategoria(categoria: 'Filmes Populares');
            },
          ),
          IconButton(
            icon: Icon(Icons.live_tv_rounded),
            onPressed: () {
              filmesProvider.getFilmes(movieOrTv: 'tv');
              filmesProvider.criarCategoria(categoria: 'Series Populares');
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              filmesProvider.criarCategoria(categoria: 'Favoritos');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              filmesProvider.criarCategoria(categoria: 'Pesquisar');
              Navigator.pushNamed(context, '/searchPage');
            },
          )
        ],
      ),
    );
  }
}
