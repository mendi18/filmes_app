import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/widget/film_card_widget.dart';
import 'package:filmes_app/service/filmes_provider.dart';

class Favoritos extends StatelessWidget {
  const Favoritos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmesProvider>(
      builder: (context, data, child) => data.listaFavoritos != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (50 / 89),
              ),
              itemCount: data.listaFavoritos.length,
              itemBuilder: (context, index) => FilmCard(
                url: data.listaFavoritos[index].posterPath,
                movie: data.listaFavoritos[index].title,
                nota: data.listaFavoritos[index].voteAverage.toString(),
                filme: data.listaFavoritos[index],
                id: data.listaFavoritos[index].id.toString(),
                movieOrtv: data.listaFavoritos[index].movieOrTv,
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
