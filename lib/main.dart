import 'package:flutter/material.dart';
import 'package:soundctionary/models/playlist.dart';
import 'package:soundctionary/models/user.dart';
import 'models/album.dart';
import 'models/artist.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soundictionary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1DB954)),
      ),
      home: const MyHomePage(title: 'Soundictionary'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final User _currentUser = const User(
    id: "1",
    imageUrl: 'https://i.scdn.co/image/ab6775700000ee8533e25cf421a9241916ac09d3',
    name: 'João Victor',
    followers: 128,
    following: 64,
  );

  final List<Playlist> _playlists = const [
    Playlist(name: 'Meu Top Mix', public: true, imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png'),
    Playlist(name: 'Late Night Vibes', public: false, imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0'),
    Playlist(name: 'Rock Pesado', public: true, imageUrl: 'https://i.scdn.co/image/ab6761610000e5eb3dc0577ed61ec73b498a56ee'),
    Playlist(name: 'Chill & Focus', public: false, imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png'),
  ];

  final List<Map<String, dynamic>> _genres = const [
    {'label': 'Alternative', 'value': 35, 'color': Color(0xFF1DB954)},
    {'label': 'R&B',         'value': 25, 'color': Color(0xFFAE17A7)},
    {'label': 'Pop',         'value': 20, 'color': Color(0xFF2D46B9)},
    {'label': 'Rock',        'value': 12, 'color': Color(0xFFE91429)},
    {'label': 'Lo-fi',       'value': 8,  'color': Color(0xFFFF6437)},
  ];

  final List<Album> _albums = const [
    Album(
      title: 'After Hours',
      artist: 'The Weeknd',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png',
    ),
    Album(
      title: 'Hit Me Hard and Soft',
      artist: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
    ),
    Album(
      title: 'Currents',
      artist: 'Tame Impala',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png',
    ),
    Album(
      title: 'Blonde',
      artist: 'Frank Ocean',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg',
    ),
    Album(
      title: 'DAMN.',
      artist: 'Kendrick Lamar',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png',
    ),
  ];

  final List<Artist> _artists = const [
    Artist(
      name: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
    ),
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
  ];

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage(albums: _albums, artists: _artists);
      case 1:
        return const SearchPage();
      case 2:
        return ProfilePage(
          user: _currentUser,
          favoriteArtists: _artists,
          playlists: _playlists,
          genres: _genres,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: const Color(0xFF1DB954),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}