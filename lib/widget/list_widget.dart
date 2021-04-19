import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/widget/filmCard_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Lista extends StatelessWidget {
  const Lista({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilmesProvider>(
      builder: (context, data, child) => data.devolverFilmes != null
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (50 / 85),
              ),
              itemCount: data.devolverFilmes.length,
              itemBuilder: (context, index) => FilmCard(
                url: data.devolverFilmes[index].poster_path,
                movie: data.devolverFilmes[index].title,
                nota: data.devolverFilmes[index].vote_average.toString(),
                filme: data.devolverFilmes[index],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
