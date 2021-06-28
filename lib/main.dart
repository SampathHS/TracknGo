import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:track_n_go/bus_seats/bus_seats.dart';
import 'package:track_n_go/gift_card/gift_card.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details2.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details3.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details4.dart';
import 'package:track_n_go/home/bottom_bar.dart';
import 'package:track_n_go/screens/details_screen.dart';
import 'package:track_n_go/screens/splash_screen.dart';
import 'package:track_n_go/app_list/profile.dart';
import 'package:track_n_go/feedback/feedback_screen.dart';
import 'package:track_n_go/home/searchscreen.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:track_n_go/screens/login_screen.dart';
import 'package:track_n_go/screens/signup_screen.dart';
import 'package:track_n_go/support/support_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:track_n_go/bus_list/bus_details.dart';
import 'package:track_n_go/bus_list/bus_list.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        bottomBar.routeName: (ctx) => bottomBar(),
        details.routeName: (ctx) => details(),
        BusDetailsPage.routeName: (ctx) => BusDetailsPage(),
        Reservations.routeName: (ctx) => Reservations(),
        bus_seats.routeName: (ctx) => bus_seats(),
      },
    );
  }
}
