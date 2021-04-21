import 'package:filmes_app/service/filmesDetales_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmPage extends StatelessWidget {
  const FilmPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Filmes'),
        backgroundColor: Colors.purple,
      ),
      body: Consumer<FilmesDetalhesProvider>(
        builder: (context, data, child) => data.filmesDetalhes != null
            ? Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w500${data.filmesDetalhes.backdrop_path}',
                        ),
                        Positioned(
                          left: 15,
                          top: 40,
                          child: Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.white,
                                width: 3,
                              ),
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w500${data.filmesDetalhes.poster_path}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
