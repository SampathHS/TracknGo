import 'package:flutter/material.dart';

class myTicket extends StatelessWidget {
  const myTicket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Ticket',style: TextStyle(color: Colors.yellowAccent),),
        backgroundColor: Colors.purple[900],
      ),
      body: Center(
        child: Text('myTicket'),
      ),
    );
  }
}
