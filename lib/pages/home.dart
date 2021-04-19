import 'package:filmes_app/pages/favoritos.dart';
import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/widget/list_widget.dart';
import 'package:filmes_app/widget/superBottomAppBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text('${Provider.of<FilmesProvider>(context).categoria}'),
      ),
      body: Provider.of<FilmesProvider>(context).indexPage == 0
          ? Lista()
          : Favoritos(),
      bottomNavigationBar: SuperBottomAppBar(),
    );
  }
}
