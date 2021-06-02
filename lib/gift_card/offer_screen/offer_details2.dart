import 'package:flutter/material.dart';
import 'package:track_n_go/home/searchscreen.dart';

class offer2 extends StatefulWidget {
  static const routeName = '/offer2';
  const offer2({Key key}) : super(key: key);

  @override
  _offer2State createState() => _offer2State();
}

class _offer2State extends State<offer2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer details',style: TextStyle(color: Colors.yellowAccent),),
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
                    SizedBox(height: 10,),
                    Image.asset('assets/gift/gift3.png',height: 150,),
                    SizedBox(height: 5,),
                    Text('Use Coupon 225 CASHBACK: Get Upto RS.225 Cashback',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          letterSpacing: .1,
                          color: Colors.blue[900]),),
                    SizedBox(height: 10.0,),
                    Text('Apply coupon code 225 CASHBACK to get 10% upto Rs.225 Instant Discount +Rs.100 TracknGo Cashback.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('This offer is valid on a minimum transaction value of Rs.500.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('Offer is valid only for private bus booking, not on KSRTC.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('All customers who have applied 225 CASHBACK and successfully completed the transaction will receive the cashback post journey completion.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('User should bu logged in to TracknGo to avail the offer.',
                      style: TextStyle(letterSpacing: 0.5), ),
                    SizedBox(height: 10.0,),
                    Text('Offer is valid between MAy1-July 31, 2021.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('This Offer is valid for all TracknGo user, once pre user during the offer peroid.',
                      style: TextStyle(letterSpacing: 0.5), ),
                    SizedBox(height: 10.0,),
                    Text('This offer cannot be combined with any other offer.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 10.0,),
                    Text('TracknGo reserves the right to disqualify any transaction or discontinue the offer promotion at any time without or liability of whatsoever nature.',
                      style: TextStyle(letterSpacing: 0.5),),
                    SizedBox(height: 30.0,),

                    FlatButton(
                      child: Text('Book Now',
                        style: TextStyle(fontSize: 20),
                      ),
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purple[900], width: 2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      color: Colors.purple[900],
                      textColor: Colors.yellowAccent,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SearchScreen.routeName);
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
