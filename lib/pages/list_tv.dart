import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/widget/film_card_widget.dart';

class ListaTV extends StatelessWidget {
  const ListaTV({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmesProvider>(
      builder: (context, data, child) => data.devolverTv != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (50 / 89),
              ),
              itemCount: data.devolverTv.length,
              itemBuilder: (context, index) => FilmCard(
                filme: data.devolverTv[index],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
