import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:track_n_go/gift_card/gift_card.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details2.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details3.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details4.dart';
import 'package:track_n_go/screens/splash_screen.dart';
import 'package:track_n_go/app_list/profile.dart';
import 'package:track_n_go/feedback/feedback_screen.dart';
import 'package:track_n_go/home/searchscreen.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:track_n_go/screens/login_screen.dart';
import 'package:track_n_go/screens/signup_screen.dart';
import 'package:track_n_go/support/support_screen.dart';



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
        profile.routeName: (ctx) => profile(),
        payment.routeName: (ctx) => payment(),
        feedback.routeName: (ctx) => feedback(),
        gift.routeName: (ctx) => gift(),
        offer_details.routeName: (ctx) => offer_details(),
        offer2.routeName: (ctx) => offer2(),
        offer3.routeName: (ctx) => offer3(),
        offer4.routeName: (ctx) => offer4(),
        support.routeName: (ctx) => support(),
      },
    );
  }
}
