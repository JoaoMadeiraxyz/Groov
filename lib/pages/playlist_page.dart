import 'package:flutter/material.dart';
import '../models/playlist.dart';

class Song {
  final String title;
  final String artist;
  final String imageUrl;
  final String duration;

  const Song({
    required this.title,
    required this.artist,
    required this.imageUrl,
    required this.duration,
  });
}

class PlaylistPage extends StatelessWidget {
  final Playlist playlist;

  const PlaylistPage({super.key, required this.playlist});

  // Mock de músicas
  static const List<Song> _songs = [
    Song(
      title: 'The Summoning',
      artist: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
      duration: '6:35',
    ),
    Song(
      title: 'Glimpse of Us',
      artist: 'Joji',
      imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc',
      duration: '3:53',
    ),
    Song(
      title: 'Lunch',
      artist: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
      duration: '2:45',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildHeader(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => _buildSongItem(index),
              childCount: _songs.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              playlist.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Positioned(
              left: 16,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    playlist.public ? 'Playlist pública' : 'Playlist privada',
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildSongItem(int index) {
    final song = _songs[index];

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${index + 1}',
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              song.imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      title: Text(
        song.title,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        song.artist,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      trailing: Text(
        song.duration,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}