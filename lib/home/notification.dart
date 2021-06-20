import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  const notification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Notification',style: TextStyle(color: Colors.yellowAccent),),
          backgroundColor: Colors.purple[900],
      ),
      body: Center(
        child: Text('Notification'),
      ),
    );
  }
}