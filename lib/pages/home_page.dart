import 'package:flutter/material.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../widgets/horizontal_card_list.dart';

class HomePage extends StatelessWidget {
  final List<Album> albums;
  final List<Artist> artists;

  const HomePage({super.key, required this.albums, required this.artists});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 36.0, bottom: 8.0, left: 32.0),
            child: Text(
              'Groov',
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, bottom: 24.0),
            child: Text(
              'O seu catálogo de músicas',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, bottom: 16.0),
            child: Text(
              'Álbuns em destaque',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          HorizontalCardList(
            items: albums
                .map((a) => {'imageUrl': a.imageUrl, 'title': a.title, 'subtitle': a.artist})
                .toList(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 32.0, top: 16.0, bottom: 16.0),
            child: Text(
              'Artistas em destaque',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          HorizontalCardList(
            items: artists
                .map((a) => {'imageUrl': a.imageUrl, 'title': a.name})
                .toList(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}