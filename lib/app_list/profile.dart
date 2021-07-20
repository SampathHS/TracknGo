import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class profile extends StatefulWidget {
  static const routeName = '/profile';
  const profile({Key key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String Name;
  String Email;
  String PhoneNumber;
  String Address;
  String insurence;
  bool dataarrived=false;
  @override
  void initState() {
    readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: Colors.black12,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: dataarrived? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 50.0,
              ),
            ),
            Divider(
              height: 50.0,
              color: Colors.grey[800],
            ),
            Text(
              'User Name',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            //SizedBox(height: 5.0),
            Text(
              Name,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Email Address',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            //SizedBox(height: 2.0),
            Text(
              Email,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Phone Number',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            //SizedBox(height: 2.0),
            Text(
              PhoneNumber,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Address',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            //SizedBox(height: 2.0),
            Text(
              Address,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Lifetime Insurance',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
                fontSize: 20.0,
              ),
            ),
            //SizedBox(height: 2.0),
            Text(
              insurence,
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 1.0,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 20.0,),

              ],
            )
          ],
        ):CircularProgressIndicator(),
      ),
    );
  }

  Future<void> readData() async {

    FirebaseAuth auth = FirebaseAuth.instance;
    final String userID = auth.currentUser.uid;
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('track_n_go')
        .doc('user_info')
        .collection('user_details').doc(userID);
    await docRef.get().then((querySnapshot){
      Name = querySnapshot.get('name');
      Address =querySnapshot.get('address');
      Email = querySnapshot.get('email');
      insurence = querySnapshot.get('insurance');
      PhoneNumber  = querySnapshot.get('phone_number');
    }
    );

    setState(() {
      dataarrived = true;
    }
    );
  }

}
