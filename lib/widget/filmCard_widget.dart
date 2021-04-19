import 'package:filmes_app/class/filmes.dart';
import 'package:filmes_app/service/filmes_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmCard extends StatefulWidget {
  FilmCard({this.movie, this.nota, this.url, this.filme});

  final String url;
  final String movie;
  final String nota;
  final Filmes filme;

  @override
  _FilmCardState createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  Color cor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: InkWell(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w500${widget.url}',
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: cor,
                    size: 30,
                  ),
                  onPressed: () {
                    if (cor == Colors.white) {
                      cor = Colors.red;
                      setState(() {});
                      Provider.of<FilmesProvider>(context, listen: false)
                          .criarListaFavoritos(widget.filme);
                    } else {
                      cor = Colors.white;
                      setState(() {});
                      Provider.of<FilmesProvider>(context, listen: false)
                          .retirarListaFavoritos(widget.filme);
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 3),
            Text(
              '${widget.movie}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '${widget.nota}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/filmPage');
        },
      ),
    );
  }
}
