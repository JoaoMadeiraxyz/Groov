import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../models/album.dart';
import '../models/song.dart';
import 'album_page.dart';

class ArtistPage extends StatelessWidget {
  final Artist artist;

  const ArtistPage({super.key, required this.artist});

  static final List<Song> _popularSongs = const [
    Song(title: 'The Summoning',  artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '6:35'),
    Song(title: 'The Crater',     artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '4:12'),
    Song(title: 'Chokehold',      artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '5:01'),
    Song(title: 'The Offering',   artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '3:48'),
    Song(title: 'Aqua Regia',     artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '4:55'),
  ];

  static final List<Album> _albums = [
    Album(
      title: 'Take Me Back to Eden',
      artist: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
      year: 2023,
      songs: _popularSongs,
    ),
    Album(
      title: 'This Place Will Become Your Home',
      artist: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
      year: 2021,
      songs: const [
        Song(title: 'The Love You Want', artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '3:22'),
        Song(title: 'Alkaline',          artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '4:10'),
        Song(title: 'Jaws',              artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '3:55'),
      ],
    ),
    Album(
      title: 'Sundowning',
      artist: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
      year: 2019,
      songs: const [
        Song(title: 'The Offering',  artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '5:30'),
        Song(title: 'Dark Signs',    artist: 'Sleep Token', imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0', duration: '4:44'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverToBoxAdapter(child: _buildActions()),
          SliverToBoxAdapter(child: _buildPopularSongs()),
          SliverToBoxAdapter(child: _buildAlbums(context)),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 320,
      pinned: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              artist.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[900]),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.transparent, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 1.0],
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
                    artist.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${_formatFollowers(artist.followers)} seguidores',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.grey),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text('Seguir', style: TextStyle(color: Colors.white)),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.grey),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.shuffle, color: Colors.grey),
            onPressed: () {},
          ),
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: Color(0xFF1DB954),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow, color: Colors.black, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularSongs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, bottom: 12, top: 8),
          child: Text(
            'Populares',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ...List.generate(_popularSongs.length, (index) {
          final song = _popularSongs[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 20,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    song.imageUrl,
                    width: 44,
                    height: 44,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            title: Text(song.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(song.duration, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(width: 8),
                const Icon(Icons.more_vert, color: Colors.grey, size: 18),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildAlbums(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
          child: Text(
            'Álbuns',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _albums.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (context, i) {
              final album = _albums[i];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AlbumPage(album: album)),
                ),
                child: SizedBox(
                  width: 140,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          album.imageUrl,
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 140,
                            height: 140,
                            color: Colors.grey[800],
                            child: const Icon(Icons.album, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        album.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${album.year}',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  String _formatFollowers(int followers) {
    if (followers >= 1000000) {
      return '${(followers / 1000000).toStringAsFixed(1)}M';
    } else if (followers >= 1000) {
      return '${(followers / 1000).toStringAsFixed(1)}K';
    }
    return followers.toString();
  }
}