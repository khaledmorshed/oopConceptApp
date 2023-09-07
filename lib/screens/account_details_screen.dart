import 'package:flutter/material.dart';
import 'package:oopconceptapp/screens/history_screen.dart';

import '../classes/account.dart';
import '../classes/current_account.dart';
import '../classes/customer_class.dart';
import '../classes/saving_account.dart';
import '../classes/transaction.dart';

class AccountDetailsScreen extends StatefulWidget {
   Customer customer;
   SavingsAccount savingsAccount;
   CurrentAccount currentAccount;

  AccountDetailsScreen(this.customer, this.savingsAccount, this.currentAccount);

  @override
  State<AccountDetailsScreen> createState() => _AccountDetailsScreenState();
}

class _AccountDetailsScreenState extends State<AccountDetailsScreen> {
  final textController = TextEditingController();
  String? dropdownvalue = "Credit";
  String select = "select";
  var items = ['Credit', 'Debit'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => HistoryScreen(transaction: widget.savingsAccount.transactions,),),
            );
          }, icon: Icon(Icons.history)),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer: ${widget.customer.name}'),
                      SizedBox(height: 10),
                      Text('Savings Account Balance: \$${widget.savingsAccount.checkBalance()}'),
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DropdownButton(
                      value: dropdownvalue,
                     // value: items[0],
                     // hint: Text(select),
                      items: items.map((items){
                        return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(items),
                            )
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          dropdownvalue = value.toString();
                        });
                      }
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: TextFormField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: dropdownvalue == "Debit" ? "Debit amount" : "Credit amount"
                ),
                onChanged: (value){

                },
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  print("test.........1");
                  print("dro.....$dropdownvalue");
                  if(dropdownvalue == "Credit"){
                    print("credit..........");
                    setState(() {
                      _performCreditTransaction(widget.savingsAccount);
                    });
                  }else{
                    setState(() {
                      _performDebitTransaction(widget.savingsAccount);
                    });
                  }
                },
                child: Text("Submit")
            ),

            // Text('Current Account Balance: \$${widget.currentAccount.checkBalance()}'),
            //
            // SizedBox(height: 20),
            // Text('Transaction History:'),

            //_buildTransactionList(widget.savingsAccount.transactions),
            //_buildTransactionList(widget.currentAccount.transactions),
          ],
        ),
      ),
    );
  }

  void _performCreditTransaction(SavingsAccount account) {
    final double transactionAmount = double.parse(textController.text.trim());
    account.deposit(transactionAmount);
   // print('Transaction Details: Deposit, Amount: $transactionAmount');
  //  print('Account Balance after Deposit: \$${account.checkBalance()}');
  }

  void _performDebitTransaction(SavingsAccount account) {
    final double transactionAmount = double.parse(textController.text.trim());

    account.withdraw(transactionAmount);
   // print('Transaction Details: Deposit, Amount: $transactionAmount');
   // print('Account Balance after Deposit: \$${account.checkBalance()}');
  }

  Widget _buildTransactionList(List<Transaction> transactions) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return ListTile(
          title: Text(transaction.description!),
          subtitle: Text('${transaction.amount! > 0 ? '+' : ''}\$${transaction.amount}'),
          trailing: Text('${transaction.timestamp!.toLocal()}'),
        );
      },
    );
  }
}
