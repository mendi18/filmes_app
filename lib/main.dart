import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/pages/searchPage.dart';
import 'package:filmes_app/pages/film_details.dart';
import 'package:filmes_app/pages/home.dart';
import 'package:filmes_app/service/similar_provider.dart';
import 'package:filmes_app/service/search_provider.dart';
import 'package:filmes_app/service/filmes_provider.dart';
import 'package:filmes_app/service/filmesDetales_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FilmesProvider.init(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilmesDetalhesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SimilarProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/filmPage': (context) => FilmPage(),
          '/searchPage': (context) => SearchPage(),
        },
      ),
    );
  }
}
