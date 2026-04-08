import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/artist.dart';
import '../models/playlist.dart';
import 'horizontal_card_list.dart';
import 'playlist_list.dart';
import 'genre_donut_chart.dart';

class SharedProfileContent extends StatelessWidget {
  final User user;
  final List<Artist> favoriteArtists;
  final List<Playlist> playlists;
  final List<Map<String, dynamic>> genres;

  const SharedProfileContent({
    super.key,
    required this.user,
    required this.favoriteArtists,
    required this.playlists,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildStats(),
          const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
          _buildFavoriteArtists(),
          const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
          PlaylistList(playlists: playlists),
          const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
          GenreDonutChart(genres: genres),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 24, left: 24, right: 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1DB954), Color(0xFF121212)],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: Colors.grey[800],
            backgroundImage: NetworkImage(user.imageUrl),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(height: 16),
          Text(
            user.name,
            style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text('Perfil público', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statItem(user.followers, 'seguidores'),
          Container(width: 1, height: 32, color: Colors.grey[700], margin: const EdgeInsets.symmetric(horizontal: 24)),
          _statItem(user.following, 'seguindo'),
        ],
      ),
    );
  }

  Widget _statItem(int value, String label) {
    return Column(
      children: [
        Text(value.toString(), style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildFavoriteArtists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 16),
          child: Text('Artistas favoritos', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        HorizontalCardList(
          items: favoriteArtists.map((a) => {'imageUrl': a.imageUrl, 'title': a.name}).toList(),
        ),
      ],
    );
  }
}