import 'package:flutter/material.dart';
import 'classes/account_abstract_class.dart';
import 'classes/current_account.dart';
import 'classes/customer_class.dart';
import 'classes/saving_account.dart';
import 'classes/transaction.dart';
import 'screens/account_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Customer customer = Customer(name: "Morshed", address: "Motijheel", phoneNumber: "01749");
    final SavingsAccount savingsAccount = SavingsAccount(customer, 1000, 2);
    final CurrentAccount currentAccount = CurrentAccount(customer, 500, 1000);

    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccountDetailsScreen(customer, savingsAccount, currentAccount),
    );
  }
}


