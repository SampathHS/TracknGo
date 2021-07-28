import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class feedback extends StatefulWidget {
  static const routeName = '/feedback';

  @override
  _feedbackState createState() => _feedbackState();
}

class _feedbackState extends State<feedback> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      secret: 'ydd2b6q7vq51xdyns3dk9q2qf32vltdjmrckf6r0fxsng94n',
      projectId: 'track_n_go-lq8ragu',
      navigatorKey: _navigatorKey,
      theme: WiredashThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepPurple[900],
          secondaryColor: Colors.purple),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        home: fb(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class fb extends StatefulWidget {
  const fb({Key key}) : super(key: key);

  @override
  _fbState createState() => _fbState();
}

class _fbState extends State<fb> {
  String Email;
  bool dataarrived = false;

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback',
          style: TextStyle(color: Colors.yellowAccent),
        ),
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Lottie.asset(
                'assets/feedback1.json',
                height: 200,
              ),
              //SizedBox(height: 5,),
              Text(
                "Leave us a message, and we'll get in contact with you as soon as possible.",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              FlatButton(
                  child: Text(
                    'Click Here',
                    style: TextStyle(fontSize: 18),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(15),
                  color: Colors.purple[900],
                  textColor: Colors.yellowAccent,
                  onPressed: () {
                    Wiredash.of(context).setUserProperties(
                      userEmail: Email,
                    );
                    Wiredash.of(context).show();
                  })
            ],
          ),
        ),
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
      Email = querySnapshot.get('email');
    });

    setState(() {
      dataarrived = true;
    });
  }
}
