import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/pages/favoritos.dart';
import 'package:filmes_app/pages/list_tv.dart';
import 'package:filmes_app/pages/list_movie.dart';
import 'package:filmes_app/widget/superBottomAppBar_widget.dart';
import 'package:filmes_app/service/filmes_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final int index = Provider.of<FilmesProvider>(context).indexPage;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('${Provider.of<FilmesProvider>(context).categoria}'),
      ),
      body: escolherPagina(index),
      bottomNavigationBar: SuperBottomAppBar(),
    );
  }
}

Widget escolherPagina(int index) {
  if (index == 0) {
    return ListaMovie();
  }
  if (index == 1) {
    return ListaTV();
  } else {
    return Favoritos();
  }
}
