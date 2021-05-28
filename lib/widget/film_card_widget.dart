import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/service/filmes_detalhes_provider.dart';
import 'package:filmes_app/service/similar_provider.dart';
import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/class/filmes.dart';

class FilmCard extends StatelessWidget {
  FilmCard({this.filme});

  final Filmes filme;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FilmesProvider>(context);
    bool isSaved = provider.listaFavoritos.contains(filme);

    final a = Provider.of<FilmesDetalhesProvider>(context);
    final b = Provider.of<SimilarProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Card(
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  imagePoster(filme.posterPath),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: isSaved ? Colors.red : Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      if (isSaved) {
                        Provider.of<FilmesProvider>(context, listen: false)
                            .retirarListaFavoritos(filme);
                      } else {
                        Provider.of<FilmesProvider>(context, listen: false)
                            .criarListaFavoritos(filme);
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                filme.title ?? 'null',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                filme.voteAverage.toString() ?? 'null',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          onTap: () {
            a.getDetalhes(id: filme.id.toString(), movieOrtv: filme.movieOrTv);
            b.getFilmesSimilares(
                id: filme.id.toString(), movieOrTv: filme.movieOrTv);
            Navigator.pushNamed(context, '/filmPage');
          },
        ),
      ),
    );
  }
}

Widget imagePoster(String url) {
  if (url == 'images/image.png') {
    return Image.asset(url);
  } else {
    return Image.network('https://image.tmdb.org/t/p/w500${url}');
  }
}
