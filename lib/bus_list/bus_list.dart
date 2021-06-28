import 'package:flutter/material.dart';
import 'package:track_n_go/bus_list/bus_details.dart';


class Reservations extends StatefulWidget {
  static const routeName = '/bus_list';
  final Color color;

  const Reservations({Key key, this.color}) : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Results',
          style: TextStyle(color: Colors.yellowAccent),
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
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Material(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
                        color: widget.color,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      Positioned(
                       // bottom: 0,
                        child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 00),
                          decoration: BoxDecoration(
                              color: Color(0xFFFf6f5fb),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.87,
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 660,
                                child: ListView(
                                    children: <Widget>[
                                      // ignore: deprecated_member_use
                                      FlatButton(
                                        padding: const EdgeInsets.all(15),
                                        child: _reservationsItem(),
                                        onPressed:(){
                                          Navigator.of(context).pushNamed(BusDetailsPage.routeName);
                                        },
                                      ),


                                      // ignore: deprecated_member_use
                                      FlatButton(
                                        padding: const EdgeInsets.all(15),
                                        child: _reservationsItem1(),
                                        onPressed:(){
                                          Navigator.of(context).pushNamed(BusDetailsPage.routeName);
                                        },
                                      ),
                                      // ignore: deprecated_member_use
                                      FlatButton(
                                        padding: const EdgeInsets.all(15),
                                        child: _reservationsItem2(),
                                        onPressed:(){
                                          Navigator.of(context).pushNamed(BusDetailsPage.routeName);
                                        },
                                      ),
                                      // ignore: deprecated_member_use
                                      FlatButton(
                                        padding: const EdgeInsets.all(15),
                                        child: _reservationsItem3(),
                                        onPressed:(){
                                          Navigator.of(context).pushNamed(BusDetailsPage.routeName);
                                        },
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
            );

          }
      ),
    );
  }
}

Widget _reservationsItem() {
  return Container(
    width: 500,
    height: 190,
    margin: EdgeInsets.only(bottom: 00),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
            SizedBox(width: 15),
            Text("SRS Travels",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,),),
            SizedBox(width: 115),
            Text('\u{20B9}400',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 19)),
          ],
        ),
        //SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemDepartment(),
            _locationPlane(),
            _itemDepartment2()
          ],
        )
      ],
    ),
  );
}
Widget _reservationsItem1() {
  return Container(
    width: 500,
    height: 190,
    margin: EdgeInsets.only(bottom: 00),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
            SizedBox(width: 15),
            Text("Greenline Travels",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(width: 65),
            Text('\u{20B9}420',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
          ],
        ),
        //SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemDepartment(),
            _locationPlane(),
            _itemDepartment2()
          ],
        )
      ],
    ),
  );
}
Widget _reservationsItem2() {
  return Container(
    width: 500,
    height: 190,
    margin: EdgeInsets.only(bottom: 00),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
            SizedBox(width: 15),
            Text("VRL Travels",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(width: 115),
            Text('\u{20B9}500',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
          ],
        ),
        //SizedBox(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemDepartment(),
            _locationPlane(),
            _itemDepartment2()
          ],
        )
      ],
    ),
  );
}
Widget _reservationsItem3() {
  return Container(
    width: 500,
    height: 190,
    margin: EdgeInsets.only(bottom: 00),
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14))),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
            SizedBox(width: 15),
            Text("Volvo Travels",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            SizedBox(width: 100),
            Text('\u{20B9}480',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)
            ),
          ],
        ),
        //SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _itemDepartment(),
            _locationPlane(),
            _itemDepartment2()
          ],
        )
      ],
    ),
  );
}

Widget _itemDepartment() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       SizedBox(height: 15,),
        Text("Departure", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text("8:00 PM",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(height: 1),
        Text("DVG", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.purple[900],
            ),
            Text("4.1", style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ],
    ),

  );
}

Widget _itemDepartment2() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Arrival", style: TextStyle(color: Colors.black54)),
        SizedBox(height: 10),
        Text("11:00 AM",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        SizedBox(height: 1),
        Text("TMK", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
        SizedBox(height: 35),
      ],
    ),
  );
}

Widget _locationPlane() {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Icons.directions_bus_sharp, color: Colors.blue, size: 21),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
            Icon(Icons.location_on, color: Colors.blue, size: 21),
          ],
        ),
      ],
    ),
  );
}

