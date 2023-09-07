import 'account_abstract_class.dart';
import 'customer_class.dart';
import 'transaction.dart';

class SavingsAccount extends Account {
  double interestRate;
  List<Transaction> transactions = [];

  SavingsAccount(Customer owner, double balance, this.interestRate)
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
    if (amount > 0 && balance - amount >= 0) {
      balance -= amount;
      transactions.add(Transaction('Withdrawal', -amount));
      return true;
    }
    return false;
  }

  @override
  double checkBalance() {
    return balance + (balance * interestRate / 100);
  }
}