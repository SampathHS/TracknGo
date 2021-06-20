import 'package:flutter/material.dart';
import 'package:track_n_go/home/searchscreen.dart';
import 'package:track_n_go/home/myTicket.dart';
import 'package:track_n_go/home/notification.dart';

class bottomBar extends StatefulWidget {
  static const routeName = '/bottom';
  @override
  _bottomBarState createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {

  int _currentIndex=0;
  final List<Widget> _children=[
    SearchScreen(),
    myTicket(),
    notification(),
  ];

  void onTappedBar(int index){
    setState(() {
      _currentIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type:
        BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple[900],
        selectedItemColor: Colors.yellowAccent,
        selectedFontSize: 15,
        unselectedFontSize: 12,
        unselectedItemColor:
        Colors.white.withOpacity(.60),
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text('My Ticket'),
            icon: Icon(Icons.article_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Notification'),
            icon: Icon(Icons.notifications_active),
          )
        ],
      ),
    );
  }
}
