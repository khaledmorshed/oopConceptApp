import 'account_abstract_class.dart';
import 'customer_class.dart';
import 'transaction.dart';

class CurrentAccount extends Account {
  double overdraftLimit;
  List<Transaction> transactions = [];

  CurrentAccount(Customer owner, double balance, this.overdraftLimit)
      : super(owner, balance);

  @override
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      transactions.add(Transaction('Deposit', amount));
    }
  }

  @override
  bool withdraw(double amount) {
    if (amount > 0 && balance - amount >= -overdraftLimit) {
      balance -= amount;
      transactions.add(Transaction('Withdrawal', -amount));
      return true;
    }
    return false;
  }

  @override
  double checkBalance() {
    return balance;
  }
}