class Account {
  final String id;
  final String type;
  final String number;
  final double balance;
  final bool isFavorite;
  final String bank;

  Account({
    required this.id,
    required this.type,
    required this.number,
    required this.balance,
    this.isFavorite = false,
    required this.bank,
  });
}