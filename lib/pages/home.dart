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
    final filmesProvider = Provider.of<FilmesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${filmesProvider.categoria}'),
      ),
      body: Lista(),
      bottomNavigationBar: SuperBottomAppBar(),
    );
  }
}
