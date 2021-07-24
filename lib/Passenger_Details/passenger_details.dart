import 'package:flutter/material.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:lottie/lottie.dart';

class passenger extends StatefulWidget {
  static const routeName = '/passenger';
  final String price;
  const passenger({Key key,this.price}) : super(key: key);


  @override
  _passengerState createState() => _passengerState();
}
List gender=["Male","Female","Other"];
String select;

int _value = 0;
int _value1 = 0;

class _passengerState extends State<passenger> {
  bool _checkBoxVal = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Details',
          style: TextStyle(color: Colors.yellowAccent),),
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
          builder: (BuildContext context, BoxConstraints viewportConstraints)
          {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,),
              width: double.infinity,
              color: Colors.white70,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Lottie.asset('assets/user_id.json', height: 200,),
                    SizedBox(height: 20,),

                    Text('Passenger Details',style: TextStyle(color: Colors.black),),
                    SizedBox(height: 5,),
                    Card(
                      child: Container(
                        height: 190,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5.0),
                      ),
                        child: ListView(children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(height: 5,),
                              TextField(
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText:'Full Name',
                                    contentPadding: const EdgeInsets.all(15),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),
                              SizedBox(height: 10,),

                              TextField(
                                style: TextStyle(fontSize: 18,color: Colors.black54),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText:'Age',
                                    contentPadding: const EdgeInsets.all(15),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(5),
                                    )

                                ),
                              ),

                            ],
                          ),
                          Text("Gender*"),
                          SizedBox(height: 5,),
                           Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () =>setState(() => _value=0),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: _value==0? Colors.blue : Colors.transparent,
                                  child: Icon(Icons.male,),
                                ),
                              ),
                              SizedBox(width: 50,),
                              GestureDetector(
                                onTap: () =>setState(() => _value=1),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: _value==1 ? Colors.blue : Colors.transparent,
                                  child: Icon(Icons.female),
                                ),
                              ),
                            ],
                          )
                        ],
                        ),
                    )
                    ),
                    SizedBox(height: 5,),
                    Card(
                        child: Container(
                          height: 190,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: ListView(children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                SizedBox(height: 5,),
                                TextField(
                                  style: TextStyle(fontSize: 18,color: Colors.black54),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText:'Full Name',
                                      contentPadding: const EdgeInsets.all(15),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5),
                                      )

                                  ),
                                ),
                                SizedBox(height: 10,),

                                TextField(
                                  style: TextStyle(fontSize: 18,color: Colors.black54),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText:'Age',
                                      contentPadding: const EdgeInsets.all(15),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                        borderRadius: BorderRadius.circular(5),
                                      )

                                  ),
                                ),

                              ],
                            ),
                            Text("Gender*"),
                            SizedBox(height: 5,),
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () =>setState(() => _value1=0),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: _value1==0? Colors.blue : Colors.transparent,
                                    child: Icon(Icons.male,),
                                  ),
                                ),
                                SizedBox(width: 50,),
                                GestureDetector(
                                  onTap: () =>setState(() => _value1=1),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: _value1==1 ? Colors.blue : Colors.transparent,
                                    child: Icon(Icons.female),
                                  ),
                                ),
                              ],
                            )
                          ],
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    Row(
                     children: <Widget>[
                       Center(
                         child:  Checkbox(
                           activeColor: Colors.blue,
                           onChanged: (bool value) {
                             setState(() => this._checkBoxVal = value);
                           },
                           value: this._checkBoxVal,
                         ),
                       ),
                       Text(
                         "I agree to the "
                       ),
                       Text("Terms and Condition",style: TextStyle(color: Colors.blue),)
                     ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        child: Text('Proceed to Payment',
                          style: TextStyle(fontSize: 20),
                        ),
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple[900], width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.all(10),
                        color: Colors.purple[900],
                        textColor: Colors.yellowAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => payment(price: widget.price,)),
                          );
                         // Navigator.of(context).pushNamed(payment.routeName);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
