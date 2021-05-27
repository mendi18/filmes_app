import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/service/filmes_detalhes_provider.dart';
import 'package:filmes_app/service/similar_provider.dart';
import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/class/filmes.dart';

class FilmCard extends StatelessWidget {
  FilmCard(
      {this.movie, this.nota, this.url, this.filme, this.id, this.movieOrtv});

  final String url;
  final String movie;
  final String nota;
  final Filmes filme;
  final String id;
  final String movieOrtv;

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
                  imagePoster(url),
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
                '${movie}',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${nota}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          onTap: () {
            a.getDetalhes(id: id, movieOrtv: movieOrtv);
            b.getFilmesSimilares(id: id, movieOrTv: movieOrtv);
            Navigator.pushNamed(context, '/filmPage');
          },
        ),
      ),
    );
  }
}

Widget imagePoster(String url) {
  if (url == 'images/image.png') {
    return Image.asset('$url');
  } else {
    return Image.network('https://image.tmdb.org/t/p/w500${url}');
  }
}
