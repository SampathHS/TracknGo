// import 'package:flutter/material.dart';
// import 'package:track_n_go/bus_list/bus_details/Bus_details.dart';
// import 'package:track_n_go/bus_list/bus_details/greenLine_bus.dart';
// import 'package:track_n_go/bus_list/bus_details/srs_bus.dart';
// import 'package:track_n_go/bus_list/bus_details/vrl_bus.dart';
//
//
// class Reservations extends StatefulWidget {
//   static const routeName = '/bus_list';
//   final Color color;
//
//   const Reservations({Key key, this.color}) : super(key: key);
//
//   @override
//   _ReservationsState createState() => _ReservationsState();
// }
//
// class _ReservationsState extends State<Reservations> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Search Results',
//           style: TextStyle(color: Colors.yellowAccent),
//         ),
//         backgroundColor: Colors.purple[900],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           color: Colors.yellowAccent,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: LayoutBuilder(
//           builder: (BuildContext context, BoxConstraints viewportConstraints) {
//             return Material(
//               child: SingleChildScrollView(
//                 child: SafeArea(
//                   child: Stack(
//                     children: <Widget>[
//                       Container(
//                         padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
//                         color: widget.color,
//                         width: MediaQuery.of(context).size.width,
//                         height: MediaQuery.of(context).size.height,
//                       ),
//                       Positioned(
//                        // bottom: 0,
//                         height: MediaQuery.of(context).size.height,
//                         child: Container(
//                           padding:
//                           EdgeInsets.symmetric(horizontal: 10, vertical: 00),
//                           decoration: BoxDecoration(
//                               color: Color(0xFFFf6f5fb),
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(30),
//                                   topRight: Radius.circular(30))),
//                           width: MediaQuery.of(context).size.width,
//                           height: MediaQuery.of(context).size.height * 0.87,
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 //width: MediaQuery.of(context).size.width,
//                                 height: MediaQuery.of(context).size.height*0.89,
//                                 child: ListView(
//                                     children: <Widget>[
//                                       // ignore: deprecated_member_use
//                                       FlatButton(
//                                         padding: const EdgeInsets.all(15),
//                                         child: _reservationsItem1(),
//                                         onPressed:(){
//                                           Navigator.of(context).pushNamed(srs.routeName);
//                                         },
//                                       ),
//
//
//                                       // ignore: deprecated_member_use
//                                       FlatButton(
//                                         padding: const EdgeInsets.all(15),
//                                         child: _reservationsItem2(),
//                                         onPressed:(){
//                                           Navigator.of(context).pushNamed(greenLine.routeName);
//                                         },
//                                       ),
//                                       // ignore: deprecated_member_use
//                                       FlatButton(
//                                         padding: const EdgeInsets.all(15),
//                                         child: _reservationsItem3(),
//                                         onPressed:(){
//                                           Navigator.of(context).pushNamed(vrl.routeName);
//                                         },
//                                       ),
//                                       // ignore: deprecated_member_use
//                                       FlatButton(
//                                         padding: const EdgeInsets.all(15),
//                                         child: _reservationsItem4(),
//                                         onPressed:(){
//                                           Navigator.of(context).pushNamed(volvo.routeName);
//                                         },
//                                       ),
//                                     ]
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//
//                     ],
//                   ),
//                 ),
//               ),
//             );
//
//           }
//       ),
//     );
//   }
// }
//
// Widget _reservationsItem1() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("SRS Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,),),
//             SizedBox(width: 115),
//             Text('\u{20B9}400',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 19)),
//           ],
//         ),
//         //SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_SRS(),
//             _locationPlane(),
//             _itemDepartment2_SRS()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
// Widget _itemDepartment_SRS() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("8:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_SRS() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("11:30 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
// Widget _reservationsItem2() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("Greenline Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 65),
//             Text('\u{20B9}420',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
//           ],
//         ),
//         //SizedBox(height: 5),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_GreenLine(),
//             _locationPlane(),
//             _itemDepartment2_GreenLine()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_GreenLine() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("12:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_GreenLine() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("2:30 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
// Widget _reservationsItem3() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("VRL Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 115),
//             Text('\u{20B9}500',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
//           ],
//         ),
//         //SizedBox(height: 1),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_VRL(),
//             _locationPlane(),
//             _itemDepartment2_VRL()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_VRL() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("3:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_VRL() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("6:00 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
//
// Widget _reservationsItem4() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("Volvo Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 100),
//             Text('\u{20B9}480',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)
//             ),
//           ],
//         ),
//         //SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_Volo(),
//             _locationPlane(),
//             _itemDepartment2_Volo()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_Volo() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("6:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_Volo() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("8:30 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
//
//
//
// Widget _locationPlane() {
//   return Container(
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.blue, size: 21),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.blue, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.fiber_manual_record, color: Colors.green, size: 8),
//             Icon(Icons.location_on, color: Colors.blue, size: 21),
//           ],
//         ),
//       ],
//     ),
//   );
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:track_n_go/bus_list/bus_details/Bus_details.dart';
import 'package:track_n_go/bus_list/bus_details/greenLine_bus.dart';
import 'package:track_n_go/bus_list/bus_details/srs_bus.dart';
import 'package:track_n_go/bus_list/bus_details/vrl_bus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reservations extends StatefulWidget {
  static const routeName = '/bus_list';
  final Color color;
  final String str1;
  final String str2;
  final String date;

  //Reservations({this.str1,this.str2});

  const Reservations({Key key, this.color, this.str1, this.str2, this.date})
      : super(key: key);

  @override
  _ReservationsState createState() => _ReservationsState();
}

class _ReservationsState extends State<Reservations> {
  CollectionReference busDetails =
      FirebaseFirestore.instance.collection("bus_final");
  List<BusBean> busList = [];

  Future<void> fetchDataFromCollectionsPatents(List dataList) async {
    await busDetails.get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        Map<String, dynamic> eachPatent = result.data();
        print(result.reference.id);
        BusBean bean = BusBean(
          path:result.reference.id,
          busName: eachPatent["busname"],
          from: eachPatent["from"],
          to: eachPatent["to"],
          ftime: eachPatent["ftime"],
          ttime: eachPatent["ttime"],
          price: eachPatent["price"],
          seatStatus:eachPatent["seatStatus"]==null? null: Map<String, bool>.from(eachPatent["seatStatus"]),

        );
        dataList.add(bean);
      });
    });
    setState(() {});

  }

  @override
  void initState() {
    fetchDataFromCollectionsPatents(busList);
    super.initState();
  }

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
        return Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.89,
              child: ListView(children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    child: ListView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: busList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Column(
                            children: [
                              widget.str1 == busList[index].from &&
                                      widget.str2 == busList[index].to
                                  ? Column(
                                      children: [
                                        EachBus(
                                          date: widget.date,
                                          busbean: busList[index],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ],
                                    )
                                  : Container(),
                              //SizedBox(height: 10,),
                            ],
                          );
                          //return EachBus(

                          //busbean:busList[index],
                          //);
                        }),
                  ),
                ),
                // ignore: deprecated_member_use
                // FlatButton(
                //   padding: const EdgeInsets.all(15),
                //   child: _reservationsItem1(),
                //   onPressed:(){
                //     Navigator.of(context).pushNamed(srs.routeName);
                //   },
                // ),
                // ignore: deprecated_member_use
                // FlatButton(
                //   padding: const EdgeInsets.all(15),
                //   child: _reservationsItem2(),
                //   onPressed:(){
                //     Navigator.of(context).pushNamed(greenLine.routeName);
                //   },
                // ),
                // // ignore: deprecated_member_use
                // FlatButton(
                //   padding: const EdgeInsets.all(15),
                //   child: _reservationsItem3(),
                //   onPressed:(){
                //     Navigator.of(context).pushNamed(vrl.routeName);
                //   },
                // ),
                // // ignore: deprecated_member_use
                // FlatButton(
                //   padding: const EdgeInsets.all(15),
                //   child: _reservationsItem4(),
                //   onPressed:(){
                //     Navigator.of(context).pushNamed(volvo.routeName);
                //   },
                // ),
              ]),
            )
          ],
        );
      }),
    );
  }
}

class EachBus extends StatelessWidget {
  // final String busName;
  // final String from;
  // final String to;
  // final String ftime;
  // final String ttime;
  // final String price;
  final BusBean busbean;
  final String date;

  EachBus({this.busbean, this.date});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 2,
      child: Container(
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
                Icon(Icons.directions_bus_sharp,
                    color: Colors.purple[900], size: 32),
                SizedBox(width: 15),
                Text(
                  busbean.busName,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 150),
                Text(
                  '\u{20B9}',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(busbean.price,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              ],
            ),
            //SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15,
                      ),
                      Text("Departure",
                          style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 10),
                      Text(busbean.ftime,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 1),
                      Text(
                        busbean.from,
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.purple[900],
                          ),
                          Text(
                            "4.1",
                            style: TextStyle(color: Colors.black54),
                          ),
                          //SizedBox(width: 10,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.directions_bus_sharp,
                              color: Colors.blue, size: 21),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.blue, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.fiber_manual_record,
                              color: Colors.green, size: 8),
                          Icon(Icons.location_on, color: Colors.blue, size: 21),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 9,
                      ),
                      Text("Arrival", style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 10),
                      Text(busbean.ttime,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 1),
                      Text(busbean.to,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      FlatButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => volvo(
                                        busname: busbean.busName,
                                        from: busbean.from,
                                        Price: busbean.price,
                                        to: busbean.to,
                                        ftime: busbean.ftime,
                                        ttime: busbean.ttime,
                                        date: date,
                                    seatStatus: busbean.seatStatus,
                                    path: busbean.path,
                                      )),
                            );
                            //Navigator.of(context).pushNamed(volvo.routeName);
                          },
                          child: Text(
                            "BookNow",
                            style: TextStyle(color: Colors.purple[900]),
                          )
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BusBean {
  final String busName;
  final String from;
  final String to;
  final String ftime;
  final String ttime;
  final String price;
  final String path;
  Map<String, bool> seatStatus;

  BusBean(
      {@required this.busName,
        @required this.path,
      @required this.from,
      @required this.to,
      @required this.ftime,
      @required this.ttime,
      @required this.price,
      @required this.seatStatus});
}

//
// Widget _reservationsItem2() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("Greenline Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 65),
//             Text('\u{20B9}420',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
//           ],
//         ),
//         //SizedBox(height: 5),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_GreenLine(),
//             _locationPlane(),
//             _itemDepartment2_GreenLine()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_GreenLine() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("12:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_GreenLine() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("2:30 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
// Widget _reservationsItem3() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("VRL Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 115),
//             Text('\u{20B9}500',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)),
//           ],
//         ),
//         //SizedBox(height: 1),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_VRL(),
//             _locationPlane(),
//             _itemDepartment2_VRL()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_VRL() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("3:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_VRL() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("6:00 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
//
//
//
// Widget _reservationsItem4() {
//   return Container(
//     width: 500,
//     height: 190,
//     margin: EdgeInsets.only(bottom: 00),
//     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(14))),
//     child: Column(
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             Icon(Icons.directions_bus_sharp, color: Colors.purple[900], size: 32),
//             SizedBox(width: 15),
//             Text("Volvo Travels",
//                 style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
//             SizedBox(width: 100),
//             Text('\u{20B9}480',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20)
//             ),
//           ],
//         ),
//         //SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _itemDepartment_Volo(),
//             _locationPlane(),
//             _itemDepartment2_Volo()
//           ],
//         )
//       ],
//     ),
//   );
// }
//
//
// Widget _itemDepartment_Volo() {
//   //final String from_City;
//   //final String to_City;
//   //final String departure;
//   //final String arrival;
//   //final String amount;
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 15,),
//         Text("Departure", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("6:00 PM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Davngere", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
//         SizedBox(height: 20),
//         Row(
//           children: <Widget>[
//             Icon(
//               Icons.star,
//               color: Colors.purple[900],
//             ),
//             Text("4.1", style: TextStyle(color: Colors.black54),
//             ),
//           ],
//         ),
//       ],
//     ),
//
//   );
// }
//
// Widget _itemDepartment2_Volo() {
//   return Container(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         SizedBox(height: 9,),
//         Text("Arrival", style: TextStyle(color: Colors.black54)),
//         SizedBox(height: 10),
//         Text("8:30 AM",
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         SizedBox(height: 1),
//         Text("Tumkur", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
//         SizedBox(height: 35),
//       ],
//     ),
//   );
// }
