import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:track_n_go/home/searchscreen.dart';

import 'package:track_n_go/model/slide.dart';
import 'package:track_n_go/screens/login_screen.dart';
import 'package:track_n_go/screens/signup_screen.dart';
import 'package:track_n_go/widgets/slide_dots.dart';
import 'package:track_n_go/widgets/slideitem.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track n Go',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen(),
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       // color: Colors.purple[900],
        child: Container(
          child: Image.asset('assets/logo.png'),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.purple,Colors.blue[900]],

              )
          ),
        )
      );
  }
}



class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
 int _currentPage=0;
  final PageController _pageController= PageController(
  initialPage: 0
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.purple[900],

      child: Padding(
        padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: slideList.length,
                  itemBuilder: (ctx,i)=> SlideItem(i),
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for(int i=0;i<slideList.length; i++)
                            if( i==_currentPage)
                              SlideDots(true)
                          else
                            SlideDots(false)
                        ],
                      ),
                    )
                  ],
                )
              ],
            
            ),

      ),
          SizedBox(height: 20.0,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            FlatButton(
              child: Text('GET STARTED',style: TextStyle(fontSize: 18),
              ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
              padding: const EdgeInsets.all(15),
              color: Colors.yellow,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed(SignupScreen.routeName);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text('have an account?',style: TextStyle(fontSize: 18.0,color: Colors.white),),
              FlatButton(child: Text('login',style: TextStyle(fontSize: 18.0,color: Colors.white),
              ),
                onPressed: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
            ],
            )
          ],
          )
        ],
      ),

    )
    ),
    );

  }
}