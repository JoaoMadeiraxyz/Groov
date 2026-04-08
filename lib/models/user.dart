class User {
  final String imageUrl;
  final String name;
  final int followers;
  final int following;

  const User({
    required this.imageUrl,
    required this.name,
    required this.followers,
    required this.following,
  });
}