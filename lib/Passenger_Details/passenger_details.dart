import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:track_n_go/home/myTicket.dart';
import 'package:track_n_go/payment/payment_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as store;

enum PaymentStatus { Success, Failed, Proceesing, NotInitited, TimeOut }

class passenger extends StatefulWidget {
  static const routeName = '/passenger';
  final String price;
  int passegerCount;
  final String bookingStatusPath;
  Map<String, bool> seatStatus;
  List<PassengerDetails> passengerFields = [];
  PaymentStatus payStatus = PaymentStatus.NotInitited;
  BookingDetails bookingDetails;

  //const passenger({Key key,this.price,this.passegerCount}) : super(key: key);

  passenger(
      {this.price,
      passegerCount,
      this.bookingDetails,
      this.bookingStatusPath,
      this.seatStatus}) {
    if (passegerCount == null) {
      passegerCount = 1;
    } else {
      this.passegerCount = passegerCount;
    }
    for (int i = 0; i < this.passegerCount; i++) {
      passengerFields.add(new PassengerDetails());
    }
  }

  @override
  _passengerState createState() => _passengerState();
}

List gender = ["Male", "Female", "Other"];
String select;

int _value1 = 0;

class _passengerState extends State<passenger> {
  Future<void> updateSeat(String path, var value) async {
    store.DocumentReference colRef =
        store.FirebaseFirestore.instance.collection('bus_final').doc(path);
    colRef.update(
      {
        'seatStatus': value,
      },
    );
  }

  bool _checkBoxVal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Passenger Details',
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
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          width: double.infinity,
          color: Colors.white70,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Lottie.asset(
                  'assets/user_id.json',
                  height: 200,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Passenger Details',
                  style: TextStyle(color: Colors.black),
                ),
                for (int i = 0; i < widget.passengerFields.length; i++)
                  widget.passengerFields[i],
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Center(
                      child: Checkbox(
                        activeColor: Colors.blue,
                        onChanged: (bool value) {
                          setState(() => this._checkBoxVal = value);
                        },
                        value: this._checkBoxVal,
                      ),
                    ),
                    Text("I agree to the "),
                    Text(
                      "Terms and Condition",
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    child: Text(
                      'Proceed to Payment',
                      style: TextStyle(fontSize: 20),
                    ),
                    shape: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.purple[900], width: 2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: const EdgeInsets.all(10),
                    color: Colors.purple[900],
                    textColor: Colors.yellowAccent,
                    onPressed: () async {
                      widget.bookingDetails.passengerdetails = "";
                      for (int i = 0; i < widget.passegerCount; i++) {
                        widget.bookingDetails.passengerdetails += widget
                                .passengerFields[i].name +
                            '-' +
                            widget.passengerFields[i].age.toString() +
                            '-' +
                            (widget.passengerFields[i].value == 1 ? 'M' : 'F') +
                            ',';
                      }
                      widget.payStatus = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => payment(
                                  price: widget.bookingDetails.totalamount,
                                )),
                      );
                      if (widget.payStatus == PaymentStatus.Success) {
                        widget.bookingDetails.bookingid = DateTime.now()
                            .millisecondsSinceEpoch
                            .remainder(100000)
                            .toString();

                        store.CollectionReference colRef = store
                            .FirebaseFirestore.instance
                            .collection('booking_details');
                        colRef.add({
                          'boardingpoint': widget.bookingDetails.boardingpoint,
                          'bookingid': widget.bookingDetails.bookingid,
                          'droppingpoint': widget.bookingDetails.droppingpoint,
                          'journeydate': widget.bookingDetails.journeydate,
                          'passengerdetails':
                              widget.bookingDetails.passengerdetails,
                          'seatnumber': widget.bookingDetails.seatnumber,
                          'totalamount': widget.bookingDetails.totalamount,
                          'travelsname': widget.bookingDetails.travelsname,
                          'userId': "",
                        });
                        await updateSeat(
                            widget.bookingStatusPath, widget.seatStatus);
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    myTicket(widget.bookingDetails)));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

BookingDetails tempTicket;

class BookingDetails {
  String boardingpoint;
  String bookingid;
  String droppingpoint;
  String journeydate;
  String passengerdetails;
  String seatnumber;
  String totalamount;
  String travelsname;
  String userId;

  BookingDetails(
      {this.boardingpoint,
      this.bookingid,
      this.droppingpoint,
      this.journeydate,
      this.passengerdetails,
      this.seatnumber,
      this.totalamount,
      this.travelsname,
      this.userId});
}

class PassengerDetails extends StatefulWidget {
  int _value = 0;

  int get value => _value;
  String name = "";
  int age = 0;

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}

class _PassengerDetailsState extends State<PassengerDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Card(
          child: Container(
        height: 190,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  onChanged: (val) {
                    widget.name = val;
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Full Name',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                  onChanged: (val) {
                    widget.age = int.parse(val ?? '0');
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Age',
                      contentPadding: const EdgeInsets.all(15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ],
            ),
            Text("Gender*"),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => setState(() => widget._value = 0),
                  child: Container(
                    height: 40,
                    width: 40,
                    color:
                        widget._value == 0 ? Colors.blue : Colors.transparent,
                    child: Icon(
                      Icons.male,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () => setState(() => widget._value = 1),
                  child: Container(
                    height: 40,
                    width: 40,
                    color:
                        widget._value == 1 ? Colors.blue : Colors.transparent,
                    child: Icon(Icons.female),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
