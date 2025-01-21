class Transaction {
  final String id;
  final double amount;
  final String sourceAccount;
  final String destinationAccount;
  final String beneficiaryName;
  final DateTime date;
  final String status;

  Transaction({
    required this.id,
    required this.amount,
    required this.sourceAccount,
    required this.destinationAccount,
    required this.beneficiaryName,
    required this.date,
    required this.status,
  });
}