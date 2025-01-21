class User {
  final String id;
  final String name;
  final String email;
  final List<String> accounts;
  final String lastConnection;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.accounts,
    required this.lastConnection,
  });
}