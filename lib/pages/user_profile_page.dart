import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/artist.dart';
import '../models/playlist.dart';
import '../widgets/shared_profile_content.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  final List<Artist> favoriteArtists;
  final List<Playlist> playlists;
  final List<Map<String, dynamic>> genres;

  const UserProfilePage({
    super.key,
    required this.user,
    required this.favoriteArtists,
    required this.playlists,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SharedProfileContent(
        user: user,
        favoriteArtists: favoriteArtists,
        playlists: playlists,
        genres: genres,
      ),
    );
  }
}