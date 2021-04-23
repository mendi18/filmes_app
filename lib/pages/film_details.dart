import 'package:filmes_app/service/filmesDetales_provider.dart';
import 'package:filmes_app/widget/similares_widget.dart';
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
                color: Colors.purple,
                child: ListView(
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
                    SizedBox(height: 15),
                    Text(
                      '${data.filmesDetalhes.original_title}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.white),
                    ),
                    SizedBox(height: 15),
                    Container(
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.only(left: 5, right: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: Text(
                        '${data.filmesDetalhes.overview}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Data de Lancamento:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${data.filmesDetalhes.release_date}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      height: 30,
                      child: Divider(color: Colors.black),
                    ),
                    Text(
                      'Nota:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${data.filmesDetalhes.vote_average}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      height: 30,
                      child: Divider(color: Colors.black),
                    ),
                    Text(
                      'Bilheteria:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '${data.filmesDetalhes.revenue}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      height: 30,
                      child: Divider(color: Colors.black),
                    ),
                    Text(
                      'Recomendacoes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Similares(),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
