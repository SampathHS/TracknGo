import 'package:flutter/material.dart';
import 'package:track_n_go/Passenger_Details/passenger_details.dart';

class myTicket extends StatelessWidget {
  BookingDetails bookingDetails;

  myTicket(this.bookingDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Ticket',
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
        body: new Card(
          child: Container(
            padding: EdgeInsets.all(10),
            height: 810,
            width: 380,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5.0),
            ),
            //padding: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Text(
                      bookingDetails?.boardingpoint ?? "Davangere",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Icon(Icons.arrow_right_alt,
                        color: Colors.purple[900], size: 30),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      bookingDetails?.droppingpoint ?? "Tumkuru",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booking ID",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        bookingDetails.bookingid,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                                .copyWith(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Travels Name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                    Text(
                      bookingDetails.travelsname,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Boarding Point",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      bookingDetails.boardingpoint,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dropping Point",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      bookingDetails.droppingpoint,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
                divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name-Age-Gender",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                    SizedBox(width: 10),
                    Text(
                      bookingDetails.passengerdetails,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey, fontSize: 14),
                    ),
                    divider(),
                    Text("Journey Date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                    Text(
                      bookingDetails.journeydate,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey, fontSize: 16),
                    ),
                    divider(),
                    Text("Seat Number",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                    Text(
                      bookingDetails.seatnumber,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
                divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      "\u{20B9}" + bookingDetails.totalamount,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                              .copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Container divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }
}
