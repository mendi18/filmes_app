import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/pages/home.dart';
import 'package:filmes_app/service/filmes_provider.dart';

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
          create: (context) => FilmesProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        home: HomePage(),
      ),
    );
  }
}
