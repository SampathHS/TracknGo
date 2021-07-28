import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_n_go/app_list/profile.dart';
import 'package:track_n_go/bus_list/bus_list.dart';
import 'package:track_n_go/feedback/feedback_screen.dart';
import 'package:track_n_go/gift_card/gift_card.dart';
import 'package:track_n_go/payment/Wallet.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:track_n_go/screens/login_screen.dart';
import 'package:track_n_go/support/support_screen.dart';
import 'package:track_n_go/uitls/custom_clipper.dart';
import 'package:track_n_go/home/bottom_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DateTime currentDate = DateTime.now();
  final dateController = TextEditingController();

  @override
  void initState() {
    readData();
    super.initState();
  }

  String city1, city2;
  String Name;
  String Email;
  bool dataarrived = false;
  List<String> CityName = [
    "Bagalkot",
    "Ballari",
    "Belagavi",
    "Bengaluru",
    "Bidar",
    "Chamarajanagar",
    "Chikballapur",
    "Chikkamagaluru",
    "Chitradurga",
    "Dakshina Kannada",
    "Davangere",
    "Dharwad",
    "Gadag",
    "Hassan",
    "Haveri",
    "Kalaburagi",
    "Kodagu",
    "Kolar",
    "Koppal",
    "Mandya",
    "Mysuru",
    "Raichur",
    "Ramanagara",
    "Shivamogga",
    "Tumakuru",
    "Udupi",
    "Uttara Kannada",
    "Vijayapura",
    "Yadgir",
  ];

  @override
  void dispose() {
    // Clean up the Controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: dataarrived
              ? ListView(
                  padding: EdgeInsets.only(top: 0),
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ClipPath(
                      clipper: MyCustomClipperForDrawer(),
                      child: Container(
                        height: 220,
                        child: UserAccountsDrawerHeader(
                          accountName: Text(
                            Name,
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          accountEmail: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              Email,
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.png'),
                          ),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                            colors: [Color(0XFF4A148C), Color(0XFF292C36)],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            tileMode: TileMode.clamp,
                          )),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.assignment_ind_rounded),
                      title: Text(
                        'My Profile',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(profile.routeName);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.payment),
                      title: Text(
                        'Wallet',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(Wallet.routeName);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.feedback_outlined),
                      title: Text(
                        'Customer Feedback',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(feedback.routeName);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.wallet_giftcard_sharp),
                      title: Text(
                        'Gift Card',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(gift.routeName);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.support_agent),
                      title: Text(
                        'Support',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(support.routeName);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      onTap: () async {
                        await auth.signOut();
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                    ),
                  ],
                )
              : Container(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator()),
                  ],
                )),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.yellow,
          ),
          title: Text(
            'Search for Bus Tickets',
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: ClipPath(
            clipper: MyCustomClipperForAppBar(),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color(0XFF4A148C), Color(0XFF292C36)],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                tileMode: TileMode.clamp,
              )),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            color: Colors.white10,
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Lottie.asset(
                        'assets/bus.json',
                        height: 250,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          DropDownField(
                            onValueChanged: (dynamic value) {
                              city1 = value;
                            },
                            value: city1,
                            required: false,
                            hintText: 'Starting',
                            labelText: 'From',
                            items: CityName,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          DropDownField(
                            onValueChanged: (dynamic value) {
                              city2 = value;
                            },
                            value: city2,
                            required: false,
                            hintText: 'Destination',
                            labelText: 'To',
                            items: CityName,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                          readOnly: true,
                          controller: dateController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.date_range),
                            hintText: 'Select Date',
                            border: OutlineInputBorder(),
                          ),
                          onTap: () async {
                            var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2050),
                            );
                            dateController.text =
                                date.toString().substring(0, 10);
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      FlatButton(
                        child: Text(
                          'Search',
                          style: TextStyle(fontSize: 20),
                        ),
                        shape: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple[900], width: 2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(15),
                        color: Colors.purple[900],
                        textColor: Colors.yellowAccent,
                        onPressed: () {
                          // MaterialApp(
                          //   routes: {
                          //     Reservations.routeName: (context) =>
                          //     const Reservations(str1: city1,str2: city2),
                          //   },
                          // );
                          print(city1);
                          print(city2);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Reservations(
                                      str1: city1,
                                      str2: city2,
                                      date: dateController.text,
                                    )),
                          );
                          //return MaterialPageRoute(builder: (_)=> Reservations(str1: city1,str2: city2));
                          //Reservations(str1: city1,str2: city2);
                          //Navigator.of(context).pushNamed(Reservations.routeName);
                        },
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> readData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final String userID = auth.currentUser.uid;
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('track_n_go')
        .doc('user_info')
        .collection('user_details')
        .doc(userID);
    await docRef.get().then((querySnapshot) {
      Name = querySnapshot.get('name');

      Email = querySnapshot.get('email');
    });

    setState(() {
      dataarrived = true;
    });
  }
}
