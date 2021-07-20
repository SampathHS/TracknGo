import 'package:flutter/material.dart';
import 'package:track_n_go/bus_seats/bus_seats.dart';

class greenLine extends StatefulWidget {
  static const routeName = '/greenline';
  const greenLine({Key key}) : super(key: key);

  @override
  _greenLineState createState() => _greenLineState();
}

class _greenLineState extends State<greenLine> {
  final String image = 'assets/images/greenline1.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Greenline Travels',
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
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(
                  color: Colors.black26
              ),
              height: 400,
              child: Image.asset(image,fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: Text(
                    "Greenline Travels",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "8.4/85 reviews",
                        style: TextStyle(color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    Spacer(),
                  ],
                ),

                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple[900],
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple[900],
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple[900],
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.purple[900],
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.purple,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text("\u{20B9}400", style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0
                              ),),
                              Text("/per person",style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey
                              ),)
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.purple[900],
                          textColor: Colors.yellowAccent,
                          child: Text("Book Now", style: TextStyle(
                              fontWeight: FontWeight.normal
                          ),),
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 32.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pushNamed(bus_seats.routeName);
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text("Description".toUpperCase(), style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0
                      ),),
                      const SizedBox(height: 10.0),
                      Text("Started in 1971,we are proud to state that 'Greenline Travels' "
                          "has made tremendous progress in its chosen field and currently "
                          "commands a fleet of nearly 5000 vehicles operating on 24/7 basis.\n Visit: www.greenlineTravels.com", textAlign: TextAlign.justify, style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0
                      ),),
                      const SizedBox(height: 15.0),
                      Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.directions_bus_sharp, size: 20.0, color: Colors.black,)
                        ),
                        TextSpan(
                            text: ":City Bus Stand(4:10 PM)"
                        )
                      ]), style: TextStyle(color: Colors.black, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text.rich(TextSpan(children: [
                        WidgetSpan(
                            child: Icon(Icons.directions_bus_sharp, size: 20.0, color: Colors.black,)
                        ),
                        TextSpan(
                            text: ":Ubdt College Bus Stop(4:20 PM)"
                        )
                      ]), style: TextStyle(color: Colors.black, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
