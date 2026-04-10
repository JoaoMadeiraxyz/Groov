import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../pages/playlist_page.dart';

class PlaylistList extends StatelessWidget {
  final List<Playlist> playlists;

  const PlaylistList({super.key, required this.playlists});

  @override
  Widget build(BuildContext context) {
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
                '${playlists.length} playlists',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: playlists.length,
          itemBuilder: (context, i) {
            final playlist = playlists[i];
            return ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PlaylistPage(playlist: playlist),
                ),
              ),
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
}