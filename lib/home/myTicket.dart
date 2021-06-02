import 'package:flutter/material.dart';

class myTicket extends StatelessWidget {
  const myTicket({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Text('myTicket'),
      ),
    );
  }
}
