import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../models/user.dart';
import '../models/playlist.dart';
import '../pages/artist_page.dart';
import '../widgets/user_card.dart';
import 'user_profile_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  String _query = '';

  static const List<Artist> _artists = [
    Artist(id: '1', name: 'Sleep Token',   followers: 2100000,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
    Artist(id: '2', name: 'Billie Eilish', followers: 85000000, imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg'),
    Artist(id: '3', name: 'Joji',          followers: 12000000, imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc'),
    Artist(id: '4', name: 'Jutes',         followers: 980000,   imageUrl: 'https://i.scdn.co/image/ab67616d0000b27358092b5a587026b6b4c89f6c'),
    Artist(id: '5', name: 'Bad Omens',     followers: 3400000,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
  ];

  static const List<Playlist> _playlists = [
    Playlist(name: 'Meu Top Mix',      public: true,  imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'),
    Playlist(name: 'Late Night Vibes', public: true,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
    Playlist(name: 'Rock Pesado',      public: true,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
    Playlist(name: 'Chill & Focus',    public: true,  imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png'),
  ];

  static const List<Map<String, String>> _songs = [
    {'title': 'The Summoning',    'artist': 'Sleep Token',   'imageUrl': 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'},
    {'title': 'Glimpse of Us',    'artist': 'Joji',          'imageUrl': 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc'},
    {'title': 'Just a Thought',   'artist': 'Jutes',         'imageUrl': 'https://i.scdn.co/image/ab67616d0000b27358092b5a587026b6b4c89f6c'},
    {'title': 'Just Like Heaven', 'artist': 'Bad Omens',     'imageUrl': 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'},
    {'title': 'Lunch',            'artist': 'Billie Eilish', 'imageUrl': 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg'},
  ];

  static final List<Map<String, dynamic>> _userProfiles = [
    {
      'user': const User(id: 'u1', imageUrl: 'https://i.scdn.co/image/ab677570000ee8533e25cf421a9241916ac09d3', name: 'João Victor', followers: 128, following: 64),
      'favoriteArtists': const [
        Artist(id: '2', name: 'Sleep Token', followers: 2100000,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
        Artist(id: '3', name: 'Joji',        followers: 12000000, imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc'),
      ],
      'playlists': const [
        Playlist(name: 'Meu Top Mix', public: true, imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'),
        Playlist(name: 'Rock Pesado', public: true, imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
      ],
      'genres': const [
        {'label': 'Alternative', 'value': 35, 'color': Color(0xFF1DB954)},
        {'label': 'Rock',        'value': 25, 'color': Color(0xFFE91429)},
      ],
    },
    {
      'user': const User(id: 'u2', imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc', name: 'Maria Silva', followers: 340, following: 120),
      'favoriteArtists': const [
        Artist(id: '2', name: 'Billie Eilish', followers: 85000000, imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg'),
        Artist(id: '4', name: 'Jutes',         followers: 980000,   imageUrl: 'https://i.scdn.co/image/ab67616d0000b27358092b5a587026b6b4c89f6c'),
      ],
      'playlists': const [
        Playlist(name: 'Late Night Vibes', public: false, imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
        Playlist(name: 'Chill & Focus',    public: false, imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png'),
      ],
      'genres': const [
        {'label': 'Pop',   'value': 40, 'color': Color(0xFF2D46B9)},
        {'label': 'Lo-fi', 'value': 30, 'color': Color(0xFFFF6437)},
      ],
    },
    {
      'user': const User(id: 'u3', imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee', name: 'Carlos Drums', followers: 512, following: 88),
      'favoriteArtists': const [
        Artist(id: '5', name: 'Bad Omens',   followers: 3400000,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
        Artist(id: '1', name: 'Sleep Token', followers: 2100000,  imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
      ],
      'playlists': const [
        Playlist(name: 'Rock Pesado', public: true, imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
      ],
      'genres': const [
        {'label': 'Rock',        'value': 50, 'color': Color(0xFFE91429)},
        {'label': 'Alternative', 'value': 30, 'color': Color(0xFF1DB954)},
      ],
    },
  ];

  void _openUserProfile(BuildContext context, Map<String, dynamic> profile) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => UserProfilePage(
          user:            profile['user']            as User,
          favoriteArtists: profile['favoriteArtists'] as List<Artist>,
          playlists:       profile['playlists']       as List<Playlist>,
          genres:          profile['genres']          as List<Map<String, dynamic>>,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildSection(title: 'Perfis',    child: _buildUserList(context)),
            const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
            _buildSection(title: 'Artistas',  child: _buildArtistList(context)),
            const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
            _buildSection(title: 'Playlists', child: _buildPlaylistList()),
            const Divider(color: Color(0xFF2A2A2A), thickness: 1, height: 32),
            _buildSection(title: 'Músicas',   child: _buildSongList()),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _controller,
        onChanged: (value) => setState(() => _query = value),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Buscar músicas, playlists, perfis...',
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          suffixIcon: _query.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () {
              _controller.clear();
              setState(() => _query = '');
            },
          )
              : null,
          filled: true,
          fillColor: const Color(0xFF2A2A2A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        child,
      ],
    );
  }

  Widget _buildUserList(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _userProfiles.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, i) {
          final profile = _userProfiles[i];
          return UserCard(
            user: profile['user'] as User,
            onTap: () => _openUserProfile(context, profile),
          );
        },
      ),
    );
  }

  Widget _buildArtistList(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _artists.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, i) {
          final artist = _artists[i];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ArtistPage(artist: artist)),
            ),
            child: SizedBox(
              width: 88,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 44,
                    backgroundImage: NetworkImage(artist.imageUrl),
                    onBackgroundImageError: (_, __) {},
                    backgroundColor: Colors.grey[800],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    artist.name,
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaylistList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _playlists.length,
      itemBuilder: (context, i) {
        final playlist = _playlists[i];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              playlist.imageUrl,
              width: 52, height: 52, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 52, height: 52, color: Colors.grey[800],
                child: const Icon(Icons.queue_music, color: Colors.white),
              ),
            ),
          ),
          title: Text(playlist.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          subtitle: Text(
            playlist.public ? 'Pública' : 'Privada',
            style: TextStyle(color: playlist.public ? const Color(0xFF1DB954) : Colors.grey, fontSize: 12),
          ),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        );
      },
    );
  }

  Widget _buildSongList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _songs.length,
      itemBuilder: (context, i) {
        final song = _songs[i];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              song['imageUrl']!,
              width: 52, height: 52, fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 52, height: 52, color: Colors.grey[800],
                child: const Icon(Icons.music_note, color: Colors.white),
              ),
            ),
          ),
          title: Text(song['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
          subtitle: Text(song['artist']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          trailing: const Icon(Icons.more_vert, color: Colors.grey),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}