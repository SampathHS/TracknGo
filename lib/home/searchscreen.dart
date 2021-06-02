import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_n_go/app_list/profile.dart';
import 'package:track_n_go/feedback/feedback_screen.dart';
import 'package:track_n_go/gift_card/gift_card.dart';
import 'package:track_n_go/home/myTicket.dart';
import 'package:track_n_go/home/notification.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:track_n_go/screens/login_screen.dart';
import 'package:track_n_go/support/support_screen.dart';
import 'dart:async';
import 'package:track_n_go/uitls/custom_clipper.dart';
import 'package:lottie/lottie.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/search';
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {
  DateTime currentDate = DateTime.now();
  final dateController= TextEditingController();
  int _selectedItem = 0;
  var _pages= [myTicket(),notification()];
  void initState(){
    super.initState();
  }
  String city;
  List<String> CityName = ["Bagalkot", "Ballari", "Belagavi", "Bengaluru",
    "Bidar", "Chamarajanagar", "Chikballapur", "Chikkamagaluru",
    "Chitradurga", "Dakshina Kannada", "Davangere", "Dharwad", "Gadag",
    "Hassan", "Haveri", "Kalaburagi", "Kodagu", "Kolar", "Koppal",
    "Mandya", "Mysuru", "Raichur", "Ramanagara", "Shivamogga", "Tumakuru",
    "Udupi", "Uttara Kannada", "Vijayapura", "Yadgir",
  ];

  @override
 void dispose() {
    // Clean up the Controller when the widget is removed
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            physics: NeverScrollableScrollPhysics(),
            children: [
              ClipPath(
                clipper: MyCustomClipperForDrawer(),
                child: Container(
                  height: 220,
                  child: UserAccountsDrawerHeader(
                      accountName: Text(
                          'XYZ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                            'xyz@gmail.com',
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
                      )
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.assignment_ind_rounded),
                title: Text('Add Identity', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(profile.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Wallet', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(payment.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback_outlined),
                title: Text('Customer Feedback', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(feedback.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.wallet_giftcard_sharp),
                title: Text('Gift Card', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(gift.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.support_agent),
                title: Text('Support', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(support.routeName);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out', style: TextStyle(fontSize: 18.0),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
              ),
            ],
          ),
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
                )
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints)
        {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30,),
            color: Colors.white,
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
                        Lottie.asset('assets/bus.json', height: 250,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            DropDownField(
                              onValueChanged: (dynamic value) {
                                city = value;
                              },
                              value: city,
                              required: false,
                              hintText: 'Starting',
                              labelText: 'From',
                              items: CityName,
                            ),
                            SizedBox(height: 20.0,),
                            DropDownField(
                              onValueChanged: (dynamic value) {
                                city = value;
                              },
                              value: city,
                              required: false,
                              hintText: 'Destination',
                              labelText: 'To',
                              items: CityName,
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        TextField(
                            readOnly: true,
                            controller: dateController,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.date_range),
                                hintText: 'Select Date',
                              border: OutlineInputBorder(),
                            ),
                            onTap: () async{
                              var date = await
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2019),
                                lastDate: DateTime(2050),
                              );
                              dateController.text=date.toString().substring(0,10);
                            }
                        ),
                        SizedBox(height: 20,),
                        FlatButton(
                          child: Text('Search',
                            style: TextStyle(fontSize: 20),
                          ),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple[900], width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(15),
                          color: Colors.purple[900],
                          textColor: Colors.yellowAccent,
                          onPressed: () {
                            Navigator.of(context).pushNamed(SearchScreen.routeName);
                          },
                        ),
                      ]

                  ),
                ),

              ),

          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
          type:
          BottomNavigationBarType.fixed,
          backgroundColor: Colors.purple[900],
          selectedItemColor: Colors.yellowAccent,
          unselectedItemColor:
          Colors.white.withOpacity(.60),

        selectedFontSize: 14,
        unselectedFontSize: 14,
        //currentIndex: 0,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        currentIndex: _selectedItem,

        onTap: (index) {
            setState(() {
              _selectedItem=index;

            });
        },
        items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
        // ignore: deprecated_member_use
        title: Text('Home'),
        icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
        // ignore: deprecated_member_use
        title: Text('My Ticket'),
        icon: Icon(Icons.article_outlined),
        ),
        BottomNavigationBarItem(
        // ignore: deprecated_member_use
        title: Text('Notification'),
        icon: Icon(Icons.notifications_active),
          ),
        ],

       // onTap: () {},
        //onTap: _onItemTap;
      ),
    );
  }
}
