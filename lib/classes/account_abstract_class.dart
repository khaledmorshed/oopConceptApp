import 'customer_class.dart';

abstract class Account {
  Customer owner;
  double balance;

  Account(this.owner, this.balance);

  void deposit(double amount);
  bool withdraw(double amount);
  double checkBalance();
}