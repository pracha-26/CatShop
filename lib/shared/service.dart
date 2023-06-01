class Shared {
  static const String baseUrl = "https://882a-2405-9800-ba20-5abd-5cee-7ac4-c72d-60a.ngrok-free.app";
}

class User {
  int id;
  String name;
  String email;
  int row;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.row,
  });
}