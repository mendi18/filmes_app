import 'package:filmes_app/service/similar_provider.dart';
import 'package:filmes_app/widget/film_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Similares extends StatelessWidget {
  const Similares({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SimilarProvider>(
      builder: (context, data, child) => data.filmesSimilares != null
          ? GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (50 / 93),
              ),
              itemCount: data.filmesSimilares.length,
              itemBuilder: (context, index) => FilmCard(
                url: data.filmesSimilares[index].posterPath,
                movie: data.filmesSimilares[index].title,
                nota: data.filmesSimilares[index].voteAverage.toString(),
                filme: data.filmesSimilares[index],
                id: data.filmesSimilares[index].id.toString(),
                movieOrtv: data.filmesSimilares[index].movieOrTv,
              ),
            )
          : Container(),
    );
  }
}
