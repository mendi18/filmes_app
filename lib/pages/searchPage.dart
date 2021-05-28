import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:filmes_app/widget/film_card_widget.dart';
import 'package:filmes_app/service/search_provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buscador = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: TextField(
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
            labelText: 'Pesquise...',
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: EdgeInsets.only(bottom: 20),
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
            fillColor: Colors.white,
            labelStyle:
                TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 1),
          ),
          onChanged: (String value) {
            if (value.length >= 3) {
              buscador.getSearchFilmes(buscar: value.toLowerCase());
            }
          },
          onSubmitted: (String value) {
            buscador.getSearchFilmes(buscar: value.toLowerCase());
          },
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, data, child) => data.devolverFilmesBuscados != null
            ? GridView.count(
                childAspectRatio: (50 / 89),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: List.generate(
                  data.devolverFilmesBuscados.length,
                  (index) {
                    return FilmCard(
                      filme: data.devolverFilmesBuscados[index],
                    );
                  },
                ),
              )
            : Container(),
      ),
    );
  }
}
