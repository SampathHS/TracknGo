import 'package:flutter/material.dart';
import 'package:track_n_go/Passenger_Details/passenger_details.dart';


class bus_seats extends StatefulWidget {
  static const routeName = '/bus_seats';
  final String busname;
  final String from;
  final String to;
  final String date;
  final String price;


  bus_seats({this.busname, this.from, this.to,this.date,this.price});

  @override
  _bus_seatsState createState() => _bus_seatsState();
}

class _bus_seatsState extends State<bus_seats> {
  bool _checkBoxVal = true;
  bool dataarrived=false;



  Widget buildButton(String text,Function  handler,)
  {
    return Material(

      child: IconButton(

        padding: new EdgeInsets.all(2),
        icon: new Image.asset("assets/images/seat.png"),

        onPressed: handler,

      ),
    );
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
                  icon:   Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                  }),
              title: RichText(
                  text: TextSpan(
                      text: widget.from!=null? widget.from+"=>"+widget.to:"",
                      style: TextStyle(fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.busname!=null? "\n"+widget.busname+","+widget.date:"",
                          style: TextStyle(fontSize: 14),
                        ),
                      ]
                  )
              ),
              bottom: TabBar(
                tabs: [
                  Tab(
                      child:Text("Seat Selection")
                  ),
                  Tab(
                      child:Text("Boarding Point")
                  ),
                  Tab(
                      child:Text("Dropping Point")
                  ),
                ],
              ),
            ),
            body: TabBarView(
                children: [

                  new Card(

                    child: new Container(

                      height: 20,
                      width: 50,
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20.0),
                    ),








                      child: ListView(children:<Widget>[


                        Column(


                          children: <Widget> [
                            Row(
                              children: [
                                SizedBox(height: 20,),
                                IconButton(onPressed: null,icon: Icon(Icons.circle,color: Colors.lightGreenAccent)),
                                //SizedBox( width:1.0),
                                Text("Selected",style: TextStyle(fontSize: 15.0,),),
                                SizedBox( width:10.0),

                                IconButton(onPressed: null,icon: Icon(Icons.circle,color: Colors.grey)),
                                //SizedBox( width:1.0),
                                Text("Available",style: TextStyle(fontSize: 15.0,),),
                                SizedBox( width:10.0),

                                IconButton(onPressed: null,icon: Icon(Icons.circle,color: Colors.red)),
                                //SizedBox( width:1.0),
                                Text("Reserved",style: TextStyle(fontSize: 15.0,),),


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
                          children:<Widget>[
                            SizedBox( width: 320.0),
                            IconButton(onPressed: null,icon: new Image.asset("assets/images/driver.png")),

                          ],
                        ),








                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("1",(){print("1");}),
                            SizedBox(width: 20.0),
                            buildButton("2",(){print("2");}),
                            SizedBox(width: 110.0),
                            buildButton("3",(){print("3");}),
                            SizedBox(width: 20.0),
                            buildButton("4",(){print("4");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("5",(){print("5");}),
                            SizedBox(width: 20.0),
                            buildButton("6",(){print("6");}),
                            SizedBox(width: 110.0),
                            buildButton("7",(){print("7");}),
                            SizedBox(width: 20.0),
                            buildButton("8",(){print("8");}),
                            SizedBox(width: 20,),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("9",(){print("9");}),
                            SizedBox(width: 20.0),
                            buildButton("10",(){print("10");}),
                            SizedBox(width: 110.0),
                            buildButton("11",(){print("11");}),
                            SizedBox(width: 20.0),
                            buildButton("12",(){print("12");}),

                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("13",(){print("13");}),
                            SizedBox(width: 20.0),
                            buildButton("14",(){print("14");}),
                            SizedBox(width: 110.0),
                            buildButton("15",(){print("15");}),
                            SizedBox(width: 20.0),
                            buildButton("16",(){print("16");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("17",(){print("17");}),
                            SizedBox(width: 20.0),
                            buildButton("18",(){print("18");}),
                            SizedBox(width: 110.0),
                            buildButton("19",(){print("19");}),
                            SizedBox(width: 20.0),
                            buildButton("20",(){print("20");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("21",(){print("21");}),
                            SizedBox(width: 20.0),
                            buildButton("22",(){print("22");}),
                            SizedBox(width: 110.0),
                            buildButton("23",(){print("23");}),
                            SizedBox(width: 20.0),
                            buildButton("24",(){print("24");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("25",(){print("25");}),
                            SizedBox(width: 20.0),
                            buildButton("26",(){print("26");}),
                            SizedBox(width: 110.0),
                            buildButton("27",(){print("27");}),
                            SizedBox(width: 20.0),
                            buildButton("28",(){print("28");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("29",(){print("29");}),
                            SizedBox(width: 20.0),
                            buildButton("30",(){print("30");}),
                            SizedBox(width: 110.0),
                            buildButton("31",(){print("31");}),
                            SizedBox(width: 20.0),
                            buildButton("32",(){print("32");}),
                          ],

                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 20.0,),
                            buildButton("33",(){print("33");}),
                            SizedBox(width: 20.0),
                            buildButton("34",(){print("34");}),
                            SizedBox(width: 30.0),
                            buildButton("35",(){print("35");}),
                            SizedBox(width: 30.0),
                            buildButton("36",(){print("36");}),
                            SizedBox(width: 20.0),
                            buildButton("37",(){print("37");}),
                          ],

                        ),
                        Column(
                          children: <Widget> [
                            Divider(
                              color: Colors.black,

                              thickness: 2,
                            ),
                          ],

                        ),

                        SizedBox( height:50.0),
                        Row(

                            children: <Widget> [
                              SizedBox(width: 10.0),
                              Text("Seat no: 45,46",style: TextStyle(fontSize: 20.0,),),

                            ]
                        ),
                        Row(
                          children: <Widget> [
                            SizedBox(width: 10.0),
                            Text("Amount: Rs.1300.0",style: TextStyle(fontSize: 20.0,),),

                          ],
                        ),

                      ],
                      ),
                    ),

                  ),


                  new Card(
                    child: ListView(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Select a bus station",style: TextStyle(fontSize: 30.0,),),
                        ],
                      ),
                      SizedBox(height:30.0),
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
                            widget.from!=null? widget.from+" Bus Stand ":"",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
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
                    child: ListView(children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Select a bus station",style: TextStyle(fontSize: 30.0,),),
                        ],
                      ),
                      SizedBox(height:30.0),

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
                            widget.to!=null? widget.to+" Bus Stand ":"",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),
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
                        children: <Widget> [
                          SizedBox(height: 800.0),
                          SizedBox(width: 320.0),

                          IconButton(icon: Icon(Icons.arrow_forward,color: Colors.purple[900],), onPressed: ()
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => passenger(price: widget.price,)),
                            );
                            //Navigator.of(context).pushNamed(passenger.routeName);
                          }
                          ),
                        ],
                      ),




                    ],
                    ),
                  ),
                ]

            ),
          ),
        )








    );





  }
}

void setState(bool Function() param0) {
}


