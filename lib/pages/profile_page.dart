import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/user.dart';
import '../models/artist.dart';
import '../models/playlist.dart';
import '../widgets/horizontal_card_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Dados hard coded — virão da API futuramente
  static const User _user = User(
    imageUrl: 'https://i.scdn.co/image/ab6775700000ee8533e25cf421a9241916ac09d3',
    name: 'João Victor',
    followers: 128,
    following: 64,
  );

  static const List<Artist> _favoriteArtists = [
    Artist(
      name: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
    ),
    Artist(
      name: 'Jutes',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b27358092b5a587026b6b4c89f6c',
    ),
    Artist(
      name: 'Joji',
      imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc',
    ),
    Artist(
      name: 'Bad Omens',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee',
    ),
    Artist(
      name: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
    ),
  ];

  static const List<Playlist> _playlists = [
    Playlist(
      name: 'Meu Top Mix',
      public: true,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
    ),
    Playlist(
      name: 'Late Night Vibes',
      public: false,
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
    ),
    Playlist(
      name: 'Rock Pesado',
      public: true,
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee',
    ),
    Playlist(
      name: 'Chill & Focus',
      public: false,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png',
    ),
  ];

  // Gêneros hard coded — virão da API futuramente
  static const List<Map<String, dynamic>> _genres = [
    {'label': 'Alternative', 'value': 35, 'color': Color(0xFF1DB954)},
    {'label': 'R&B', 'value': 25, 'color': Color(0xFFAE17A7)},
    {'label': 'Pop', 'value': 20, 'color': Color(0xFF2D46B9)},
    {'label': 'Rock', 'value': 12, 'color': Color(0xFFE91429)},
    {'label': 'Lo-fi', 'value': 8, 'color': Color(0xFFFF6437)},
  ];

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
          _buildPlaylists(),
          const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
          _buildGenreChart(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ── Header com foto, nome, seguidores ──────────────────────────────────────
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
            backgroundImage: NetworkImage(_user.imageUrl),
            onBackgroundImageError: (_, __) {},
          ),
          const SizedBox(height: 16),
          Text(
            _user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Perfil público',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ── Seguidores / Seguindo ──────────────────────────────────────────────────
  Widget _buildStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _statItem(_user.followers, 'seguidores'),
          Container(
            width: 1,
            height: 32,
            color: Colors.grey[700],
            margin: const EdgeInsets.symmetric(horizontal: 24),
          ),
          _statItem(_user.following, 'seguindo'),
        ],
      ),
    );
  }

  Widget _statItem(int value, String label) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ],
    );
  }

  // ── Artistas favoritos ─────────────────────────────────────────────────────
  Widget _buildFavoriteArtists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 16),
          child: Text(
            'Artistas favoritos',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        HorizontalCardList(
          items: _favoriteArtists
              .map((a) => {'imageUrl': a.imageUrl, 'title': a.name})
              .toList(),
        ),
      ],
    );
  }

  // ── Playlists ──────────────────────────────────────────────────────────────
  Widget _buildPlaylists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Playlists',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${_playlists.length} playlists',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _playlists.length,
          itemBuilder: (context, i) {
            final playlist = _playlists[i];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  playlist.imageUrl,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 52,
                    height: 52,
                    color: Colors.grey[800],
                    child: const Icon(Icons.queue_music, color: Colors.white),
                  ),
                ),
              ),
              title: Text(
                playlist.name,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                playlist.public ? 'Pública' : 'Privada',
                style: TextStyle(
                  color: playlist.public ? const Color(0xFF1DB954) : Colors.grey,
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            );
          },
        ),
      ],
    );
  }

  // ── Gráfico de gêneros (donut chart customizado) ───────────────────────────
  Widget _buildGenreChart() {
    final total = _genres.fold<int>(0, (sum, g) => sum + (g['value'] as int));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24, bottom: 24),
          child: Text(
            'Gêneros mais ouvidos',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 24),
            // Donut chart
            SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(
                painter: _DonutChartPainter(genres: _genres, total: total),
              ),
            ),
            const SizedBox(width: 32),
            // Legenda
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _genres.map((g) {
                  final pct = ((g['value'] as int)).round();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: g['color'] as Color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            g['label'] as String,
                            style: const TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        Text(
                          '$pct',
                          style: const TextStyle(color: Colors.grey, fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 24),
          ],
        ),
      ],
    );
  }
}

// ── Painter do donut chart ─────────────────────────────────────────────────
class _DonutChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> genres;
  final int total;

  _DonutChartPainter({required this.genres, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 28.0;
    const gap = 0.04; // gap em radianos entre fatias

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;

    double startAngle = -math.pi / 2;

    for (final genre in genres) {
      final sweep = (genre['value'] as int) / total * 2 * math.pi - gap;
      paint.color = genre['color'] as Color;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius - strokeWidth / 2),
        startAngle,
        sweep,
        false,
        paint,
      );
      startAngle += sweep + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}