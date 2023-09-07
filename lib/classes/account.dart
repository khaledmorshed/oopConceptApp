import 'customer_class.dart';
import 'transaction_history.dart';

abstract class Account /* implements TransactionHistory */{
  Customer owner;
  double balance;

  Account(this.owner, this.balance);

  void deposit(double amount);
  bool withdraw(double amount);
  double checkBalance();
}