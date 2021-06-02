import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';

_sendingMails() async {
  const url = 'mailto:1si18cs098@sit.ac.in';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sendingSMS() async {
  const url = 'sms:9686374957';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}


class support extends StatefulWidget {
  static const routeName = '/support';
  const support({Key key}) : super(key: key);

  @override
  _supportState createState() => _supportState();
}

class _supportState extends State<support> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support',style: TextStyle(color: Colors.yellowAccent),),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                  width: double.infinity,
                  color: Colors.white70,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Lottie.asset('assets/support.json', height: 200),
                        Container(
                          height: 20.0,
                        ),
                        Text('we are here to help you with any information and problems through our contact center.',
                          style: TextStyle(letterSpacing: 0.5,fontSize: 16),),
                        Container(
                          height: 10.0,
                        ),

                        Text(
                          'Mail us',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                        FlatButton(
                          child: Text('Click Here',
                            style: TextStyle(fontSize: 20),
                          ),
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.black),
                            ),
                          padding: const EdgeInsets.all(15),
                          color: Colors.purple[900],
                          textColor: Colors.yellowAccent,
                          onPressed: _sendingMails,
                        ),
                        Container(
                          height: 20.0,
                        ),
                        Text(
                          'Or Send SMS',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.blue,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),

                        FlatButton(
                          child: Text('Click Here',
                            style: TextStyle(fontSize: 20),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black),
                          ),
                          padding: const EdgeInsets.all(15),
                          color: Colors.purple[900],
                          textColor: Colors.yellowAccent,
                          onPressed: _sendingSMS,
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
