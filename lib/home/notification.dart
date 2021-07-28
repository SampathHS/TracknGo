import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  @override
  _notification createState() => _notification();
}

class _notification extends State<notification> {
  // Title List Here
  var titleList = [
    "Save Upto \u{20B9} 200 on bus tickets",
    "Get Cashback upto \u{20B9} 500",
    "This pandemic has taught us to \nstay prepared for uncertainities.",
  ];

  // Description List Here
  var descList = [
    "30-June-2021 to 31-August-2021\nUse Code:FIRST",
    "05-May-2021 to 31-Oct-2021\nPay Using OlaMoney Postpaid ",
    "Get Life Insurance.Start @ less than \u{20B9}3/day",
  ];

  // Image Name List Here
  var imgList = [
    "assets/img.png",
    "assets/img.png",
    "assets/img.png",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Notification',
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
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 150,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
