import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_n_go/home/bottom_bar.dart';
import 'package:track_n_go/screens/components/body.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class details extends StatefulWidget {
  static const routeName = '/details';
  const details({Key key}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  String city;
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController PhoneNumber = TextEditingController();
  TextEditingController Address = TextEditingController();
 // TextEditingController insurence;
  List<String> CityName = ["Yes","No"];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(
              color: Colors.yellowAccent),
        ),
        backgroundColor: Colors.purple[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.yellowAccent,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30,),
              width: double.infinity,
                color: Colors.white10,
                child: SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                      

                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Body(),
                              SizedBox(height: 20,),
                              Text('User Name',style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 5,),
                              TextFormField(
                                controller: Name,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the valid text ';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'John',
                                    prefixIcon: Icon(Icons.account_circle_outlined),
                                    contentPadding: const EdgeInsets.all(15),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),
                              SizedBox(height: 10,),
                              Text("Email",style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 5,),
                              TextFormField(
                                  controller: Email,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the valid text ';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'demo@gmail.com',
                                    prefixIcon: Icon(Icons.email),
                                    contentPadding: const EdgeInsets.all(15),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Phone No',style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 5,),
                              TextFormField(
                                  controller: PhoneNumber,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the valid text ';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: '+91 9876543210',
                                    prefixIcon: Icon(Icons.phone),
                                    contentPadding: const EdgeInsets.all(15),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Address',style: TextStyle(color: Colors.black54),),
                              SizedBox(height: 5,),
                              TextFormField(
                                  controller: Address,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the valid text ';
                                  }
                                  return null;
                                },
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: '12 main,Bng 530068',
                                    prefixIcon: Icon(Icons.location_on_outlined),
                                    contentPadding: const EdgeInsets.all(25),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Lifetime Insurance',style: TextStyle(color: Colors.black54),),
                              DropDownField(
                                 // controller: insurence,
                                onValueChanged: (value) {
                                  setState(() {
                                    city = value;
                                  });
                                },
                                value: city,
                                required: false,
                                //hintText: 'Starting',
                                //labelText: 'From',
                                items: CityName,
                              ),
                              SizedBox(height: 20,),
                              FlatButton(
                                child: Text('Done',
                                  style: TextStyle(fontSize: 20),

                                ),
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.purple, width: 2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(15),
                                color: Colors.purple[900],
                                textColor: Colors.yellowAccent,
                                onPressed: () async{
                                  if (_formKey.currentState.validate())    {
                                    print(Name.text);
                                    print(Email.text);
                                    print(PhoneNumber.text);
                                    print(Address.text);
                              await addUserdata();
                              Navigator.of(context)
                                  .pushNamed(bottomBar.routeName);
                            }
                                  else{
                                    print('------------------------------------------');
                                  }
                          },
                              )
                            ]
                        ),
                      ),
                    )
                )
            );
          }
      )
    );
  }

  Future<void> addUserdata() async{
    CollectionReference colRef = FirebaseFirestore.instance
        .collection('track_n_go')
        .doc('user_info')
        .collection('user_details');
    FirebaseAuth auth = FirebaseAuth.instance;
    final String userID = auth.currentUser.uid;
    colRef.doc(userID).set({
      'name': Name.text,
      'email': Email.text,
      'phone_number': PhoneNumber.text,
      'address': Address.text,
      'insurance': city,
    },
        SetOptions(merge: true)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Data Updated Successfully...',
          style: TextStyle(
            color: Colors.lightGreen,
          ),
        ),
      ));
      Future.delayed(Duration(seconds: 2), () {
        //Navigator.pop(context);
      });
    });

  }



}


