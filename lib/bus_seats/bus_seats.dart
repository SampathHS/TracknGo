import 'dart:math';

import 'package:flutter/material.dart';
import 'package:track_n_go/Passenger_Details/passenger_details.dart';
import 'package:track_n_go/screens/details_screen.dart';
import 'package:track_n_go/uitls/staticVariables.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as store;
import 'package:firebase_auth/firebase_auth.dart';

class bus_seats extends StatefulWidget {
  static const routeName = '/bus_seats';
  String busname;
  String from;
  String to;
  String date;
  int price;
  int selectedCount = 0;
  String updateString = "";
  Map<String, bool> seatStatus;
  String path;
  BookingDetails bookingDetails;
  Map<int, SeatStatus> seatStatusMap = {};
  Map<SeatStatus, Color> seatColourMap = {
    SeatStatus.Available: Colors.grey,
    SeatStatus.Selected: Colors.lightGreenAccent,
    SeatStatus.Reserved: Colors.red,
  };

  bus_seats(
      {busname,
      from,
      to,
      date,
      price,
      Map<String, bool> seatStatus,
      String path}) {
    this.seatStatus = seatStatus;
    this.busname = busname;
    this.from = from;
    this.to = to;
    this.date = date;
    this.path = path;
    this.price = int.parse(price);
    if (seatStatus == null) {
      for (int i = 1; i < 38; i++) {
        seatStatusMap[i] = SeatStatus.Available;
      }
      Random random = new Random();
      int randomNumber = random.nextInt(37);
      for (int i = 1; i < randomNumber; i++) {
        int randomSeatNo = random.nextInt(37);
        seatStatusMap[randomSeatNo] = SeatStatus.Reserved;
      }
    } else {
      for (int i = 1; i < 38; i++) {
        if (seatStatus.containsKey(i.toString()) && !seatStatus[i.toString()]) {
          seatStatusMap[i] = SeatStatus.Reserved;
        } else {
          seatStatusMap[i] = SeatStatus.Available;
        }
      }
    }
  }

  @override
  _bus_seatsState createState() => _bus_seatsState();
}

class _bus_seatsState extends State<bus_seats> {
  bool _checkBoxVal = true;
  bool dataarrived = false;

  Widget buildButton(int seatNum) {
    return Material(
      child: IconButton(
        padding: new EdgeInsets.all(2),
        icon: new Image.asset(
          "assets/images/seat.png",
          color: widget.seatColourMap[widget.seatStatusMap[seatNum]],
        ),
        onPressed: () {
          if (widget.seatStatusMap[seatNum] == SeatStatus.Available) {
            this.setState(() {
              widget.seatStatusMap[seatNum] = SeatStatus.Selected;
            });
          } else if (widget.seatStatusMap[seatNum] == SeatStatus.Selected) {
            this.setState(() {
              widget.seatStatusMap[seatNum] = SeatStatus.Available;
            });
          }
          updateSummary();
        },
      ),
    );
  }

  void updateSummary() {
    widget.updateString = "";
    widget.selectedCount = 0;
    for (int i = 1; i < 38; i++) {
      if (widget.seatStatusMap[i] == SeatStatus.Selected) {
        widget.seatStatus[i.toString()] = false;
        widget.selectedCount++;
        widget.updateString += i.toString() + ', ';
      }
    }
    if (widget.selectedCount > 0) {
      widget.updateString =
          widget.updateString.substring(0, widget.updateString.length - 2);
    }
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_outlined), onPressed: () {}),
              title: RichText(
                  text: TextSpan(
                      text: widget.from != null
                          ? widget.from + "=>" + widget.to
                          : "",
                      style: TextStyle(fontSize: 20),
                      children: <TextSpan>[
                    TextSpan(
                      text: widget.busname != null
                          ? "\n" + widget.busname + "," + widget.date
                          : "",
                      style: TextStyle(fontSize: 14),
                    ),
                  ])),
              bottom: TabBar(
                tabs: [
                  Tab(child: Text("Seat Selection")),
                  Tab(child: Text("Boarding Point")),
                  Tab(child: Text("Dropping Point")),
                ],
              ),
            ),
            body: TabBarView(children: [
              new Card(
                child: new Container(
                  height: 20,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.circle,
                                      color: Colors.lightGreenAccent)),
                              //SizedBox( width:1.0),
                              Text(
                                "Selected",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(width: 10.0),

                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.circle, color: Colors.grey)),
                              //SizedBox( width:1.0),
                              Text(
                                "Available",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              SizedBox(width: 10.0),

                              IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.circle, color: Colors.red)),
                              //SizedBox( width:1.0),
                              Text(
                                "Reserved",
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 1.0),
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 320.0),
                          IconButton(
                              onPressed: null,
                              icon:
                                  new Image.asset("assets/images/driver.png")),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(1),
                          SizedBox(width: 20.0),
                          buildButton(2),
                          SizedBox(width: 110.0),
                          buildButton(3),
                          SizedBox(width: 20.0),
                          buildButton(4),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(5),
                          SizedBox(width: 20.0),
                          buildButton(6),
                          SizedBox(width: 110.0),
                          buildButton(7),
                          SizedBox(width: 20.0),
                          buildButton(8),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(9),
                          SizedBox(width: 20.0),
                          buildButton(10),
                          SizedBox(width: 110.0),
                          buildButton(11),
                          SizedBox(width: 20.0),
                          buildButton(12),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(13),
                          SizedBox(width: 20.0),
                          buildButton(14),
                          SizedBox(width: 110.0),
                          buildButton(15),
                          SizedBox(width: 20.0),
                          buildButton(16),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(17),
                          SizedBox(width: 20.0),
                          buildButton(18),
                          SizedBox(width: 110.0),
                          buildButton(19),
                          SizedBox(width: 20.0),
                          buildButton(20),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(21),
                          SizedBox(width: 20.0),
                          buildButton(22),
                          SizedBox(width: 110.0),
                          buildButton(23),
                          SizedBox(width: 20.0),
                          buildButton(24),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(25),
                          SizedBox(width: 20.0),
                          buildButton(26),
                          SizedBox(width: 110.0),
                          buildButton(27),
                          SizedBox(width: 20.0),
                          buildButton(28),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(29),
                          SizedBox(width: 20.0),
                          buildButton(30),
                          SizedBox(width: 110.0),
                          buildButton(31),
                          SizedBox(width: 20.0),
                          buildButton(32),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          buildButton(33),
                          SizedBox(width: 20.0),
                          buildButton(34),
                          SizedBox(width: 30.0),
                          buildButton(35),
                          SizedBox(width: 30.0),
                          buildButton(36),
                          SizedBox(width: 20.0),
                          buildButton(37),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ],
                      ),
                      SizedBox(height: 50.0),
                      Row(children: <Widget>[
                        SizedBox(width: 10.0),
                        Text(
                          "Seat no: " + widget.updateString,
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ]),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 10.0),
                          Text(
                            "Amount: Rs." +
                                (widget.price * widget.selectedCount)
                                    .toString(),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              new Card(
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Select a bus station",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            setState(() => this._checkBoxVal = value);
                          },
                          value: this._checkBoxVal,
                        ),
                        Text(
                          widget.from != null
                              ? widget.from + " Bus Stand "
                              : "",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("A"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    // SizedBox(height:10.0),
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("B"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    //
                    // SizedBox(height:10.0),
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("C"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    // SizedBox(height:10.0),
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("D"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                  ],
                ),
              ),
              new Card(
                child: ListView(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          "Select a bus station",
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.0),

                    Row(
                      children: <Widget>[
                        Checkbox(
                          activeColor: Colors.blue,
                          onChanged: (bool value) {
                            setState(() => this._checkBoxVal = value);
                          },
                          value: this._checkBoxVal,
                        ),
                        Text(
                          widget.to != null ? widget.to + " Bus Stand " : "",
                          style: TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),

                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("A"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    // SizedBox(height:10.0),
                    //
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("B"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    //
                    // SizedBox(height:10.0),
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("C"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    // SizedBox(height:10.0),
                    //
                    // Row(
                    //     children: <Widget> [
                    //       RaisedButton(
                    //         child: Text("D"),
                    //         onPressed: (){},
                    //         shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0) ,),
                    //       ),
                    //
                    //     ]
                    //
                    // ),
                    Row(
                      children: <Widget>[
                        SizedBox(height: 800.0),
                        SizedBox(width: 320.0),
                        IconButton(
                            icon: Icon(
                              Icons.arrow_forward,
                              color: Colors.purple[900],
                            ),
                            onPressed: () async {
                              if (widget.selectedCount > 0) {
                                //updateSeat(widget.path,widget.seatStatus);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => passenger(
                                        bookingStatusPath: widget.path,
                                            price: widget.price.toString(),
                                            seatStatus: widget.seatStatus,
                                            passegerCount: widget.selectedCount,
                                            bookingDetails: BookingDetails(
                                                boardingpoint: widget.from,
                                                droppingpoint: widget.to,
                                                journeydate: widget.date,
                                                seatnumber: widget.updateString,
                                                totalamount: (widget.price *
                                                        widget.selectedCount)
                                                    .toString(),travelsname: widget.busname),

                                          )),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Select a minimum of one seat to continue"),
                                ));
                              }

                              //Navigator.of(context).pushNamed(passenger.routeName);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  Future<void> updateSeat(String path, var value) async {
    store.DocumentReference colRef =
        store.FirebaseFirestore.instance.collection('bus_final').doc(path);
    colRef.update(
      {
        'seatStatus': value,
      },
    );
  }
}

void setState(bool Function() param0) {}
