import 'package:flutter/material.dart';

import '../classes/transaction.dart';

class HistoryScreen extends StatefulWidget {
  List<Transaction>? transaction;
   HistoryScreen({super.key, required this.transaction});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          itemBuilder: (context, index){
          return ListTile(
            title: Text(widget.transaction![index].description!),
            subtitle: Text('${widget.transaction![index].amount! > 0 ? '+' : ''}\$${widget.transaction![index].amount}'),
            trailing: Text('${widget.transaction![index].timestamp!.toLocal()}'),
          );
        }, separatorBuilder: (context, index){
          return Divider(height: 2,);
        },
          itemCount: widget.transaction!.length,),
      ),
    );
  }
}
