import 'package:flutter/material.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details2.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details3.dart';
import 'package:track_n_go/gift_card/offer_screen/offer_details4.dart';
import 'package:lottie/lottie.dart';

class gift extends StatefulWidget {
  static const routeName = '/gift';
  const gift({Key key}) : super(key: key);

  @override
  _giftState createState() => _giftState();
}

class _giftState extends State<gift> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gift Card',style: TextStyle(color: Colors.yellowAccent),),
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
                          Lottie.asset('assets/gift/gift_card.json', height: 200),
                          FlatButton(
                            child: Image.asset('assets/gift/gift1.png',height: 150,),
                            onPressed: (){
                              Navigator.of(context).pushNamed(offer_details.routeName);
                            },
                          ),
                          SizedBox(height: 15.0,),
                          FlatButton(
                            child: Image.asset('assets/gift/gift3.png',height: 150,),
                            onPressed: (){
                              Navigator.of(context).pushNamed(offer2.routeName);
                            },
                          ),
                          SizedBox(height: 15.0,),
                          FlatButton(
                            child: Image.asset('assets/gift/gift4.png',height: 150,),
                            onPressed: (){
                              Navigator.of(context).pushNamed(offer3.routeName);
                            },
                          ),
                          FlatButton(
                            child: Image.asset('assets/gift/gift2.png',height: 150,),
                            onPressed: (){
                              Navigator.of(context).pushNamed(offer4.routeName);
                            },
                          )
                        ],
                      ),
                  ),
                );
              }
      ),
    );
  }
}
