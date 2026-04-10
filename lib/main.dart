import 'package:flutter/material.dart';
import 'models/album.dart';
import 'models/artist.dart';
import 'models/playlist.dart';
import 'models/song.dart';
import 'models/user.dart';
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
      title: 'Groov',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1DB954)),
      ),
      home: const MyHomePage(title: 'Groov'),
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
      year: 2020,
      songs: [
        Song(title: 'Alone Again', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '4:10'),
        Song(title: 'Too Late', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:59'),
        Song(title: 'Hardest to Love', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:31'),
        Song(title: 'Scared to Live', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:11'),
        Song(title: 'Blinding Lights', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:20'),
        Song(title: 'In Your Eyes', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:57'),
        Song(title: 'Save Your Tears', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '3:35'),
        Song(title: 'After Hours', artist: 'The Weeknd', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/c/c1/The_Weeknd_-_After_Hours.png', duration: '6:01'),
      ],
    ),
    Album(
      title: 'Hit Me Hard and Soft',
      artist: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
      year: 2024,
      songs: [
        Song(title: 'Skinny', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '4:00'),
        Song(title: 'Lunch', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '2:45'),
        Song(title: 'Chihiro', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '5:10'),
        Song(title: 'Birds of a Feather', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '3:30'),
        Song(title: 'Wildflower', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '4:20'),
        Song(title: 'The Greatest', artist: 'Billie Eilish', imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg', duration: '4:51'),
      ],
    ),
    Album(
      title: 'Currents',
      artist: 'Tame Impala',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png',
      year: 2015,
      songs: [
        Song(title: 'Let It Happen', artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '7:47'),
        Song(title: 'Nangs', artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '1:47'),
        Song(title: 'The Moment', artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '4:14'),
        Song(title: "Yes I'm Changing", artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '4:23'),
        Song(title: 'Eventually', artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '5:18'),
        Song(title: 'The Less I Know the Better', artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '3:36'),
        Song(title: "New Person, Same Old Mistakes", artist: 'Tame Impala', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/9/9b/Tame_Impala_-_Currents.png', duration: '6:01'),
      ],
    ),
    Album(
      title: 'Blonde',
      artist: 'Frank Ocean',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg',
      year: 2016,
      songs: [
        Song(title: 'Nikes', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '5:14'),
        Song(title: 'Ivy', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '4:09'),
        Song(title: 'Pink + White', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '3:02'),
        Song(title: 'Solo', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '4:21'),
        Song(title: 'Nights', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '5:07'),
        Song(title: 'Self Control', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '4:10'),
        Song(title: 'Godspeed', artist: 'Frank Ocean', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/a/a0/Blonde_-_Frank_Ocean.jpeg', duration: '2:47'),
      ],
    ),
    Album(
      title: 'DAMN.',
      artist: 'Kendrick Lamar',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png',
      year: 2017,
      songs: [
        Song(title: 'BLOOD.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '1:59'),
        Song(title: 'DNA.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '3:05'),
        Song(title: 'YAH.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '2:39'),
        Song(title: 'ELEMENT.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '3:26'),
        Song(title: 'FEEL.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '3:35'),
        Song(title: 'LOYALTY.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '3:47'),
        Song(title: 'HUMBLE.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '2:57'),
        Song(title: 'LOVE.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '3:33'),
        Song(title: 'GOD.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '2:38'),
        Song(title: 'DUCKWORTH.', artist: 'Kendrick Lamar', imageUrl: 'https://upload.wikimedia.org/wikipedia/en/5/51/Kendrick_Lamar_-_Damn.png', duration: '4:04'),
      ],
    ),
  ];

  final List<Artist> _artists = const [
    Artist(
      id: '1',
      followers: 64432,
      name: 'Billie Eilish',
      imageUrl: 'https://atwoodmagazine.com/wp-content/uploads/2024/06/HIT-ME-HARD-AND-SOFT-Billie-Eilish-album-cover-1170x780.jpeg',
    ),
    Artist(
      id: '2',
      followers: 64432,
      name: 'Sleep Token',
      imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebd00c2ff422829437e6b5f1e0',
    ),
    Artist(
      id: '3',
      followers: 64432,
      name: 'Jutes',
      imageUrl: 'https://i.scdn.co/image/ab67616d0000b27358092b5a587026b6b4c89f6c',
    ),
    Artist(
      id: '4',
      followers: 64432,
      name: 'Joji',
      imageUrl: 'https://i.scdn.co/image/ab67616100005174b6d7836808e8b99fc8c7aadc',
    ),
    Artist(
      id: '5',
      followers: 64432,
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