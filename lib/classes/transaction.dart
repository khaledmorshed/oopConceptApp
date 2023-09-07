class Transaction {
  String? description;
  double? amount;
  DateTime? timestamp;

  Transaction(this.description, this.amount) {
    timestamp = DateTime.now();
  }
}