import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  FilmCard({this.movie, this.nota, this.url});

  final String url;
  final String movie;
  final String nota;

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
                  'https://image.tmdb.org/t/p/w500$url',
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {},
                )
              ],
            ),
            SizedBox(height: 3),
            Text(
              '$movie',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                letterSpacing: 0.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$nota',
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
