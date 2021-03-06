import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/widget/film_card_widget.dart';

class ListaMovie extends StatelessWidget {
  const ListaMovie({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmesProvider>(
      builder: (context, data, child) => data.devolverFilmes != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (50 / 89),
              ),
              itemCount: data.devolverFilmes.length,
              itemBuilder: (context, index) => FilmCard(
                filme: data.devolverFilmes[index],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
