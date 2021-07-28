import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:track_n_go/Passenger_Details/passenger_details.dart';

// ignore: camel_case_types
class payment extends StatefulWidget {
  static const routeName = '/payment';
  final String price;
  const payment({Key key, this.price}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String PhoneNumber;
  String Email;
  String Amount;
  bool dataarrived = false;
  static const platfrom = const MethodChannel("razorpzy_flutter");

  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    readData();
    // TODO: implement initState
    super.initState();

    _razorpay = new Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSucess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_Qs38n2LORuU2Eh",
      //"amount": num.parse(PhoneNumber)*100,
      "amount": int.parse(widget.price) * 100,
      //"amount": num.parse(textEditingController.text)*100,
      "name": "Track_n_Go",
      "description": "Payment",
      "timeout": 120,
      "prefill": {
        "contact": PhoneNumber,
        "email": Email,
      },
      "external": {
        "wallets": ["paytm"]
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void handlerPaymentSucess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Success:" + response.paymentId, timeInSecForIosWeb: 100);
    Navigator.pop(context, PaymentStatus.Success);
  }

  void handlerErrorFailure(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failure:" +
            response.code.toString() +
            "-" +
            response.message,
        timeInSecForIosWeb: 100);
    Navigator.pop(context, PaymentStatus.Failed);
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'External_Wallet:' + response.walletName, timeInSecForIosWeb: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text(
          'Pay Now',
          style: TextStyle(color: Colors.yellow),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.yellowAccent,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Lottie.asset(
                'assets/wallet.json',
                height: 200,
              ),
              // TextField(
              //   controller: textEditingController,
              //   maxLength: 4,
              //   decoration: InputDecoration(
              //     hintText: "Enter the amount",
              //   ),
              // ),
              //Text(PhoneNumber),
              SizedBox(
                height: 12,
              ),
              RaisedButton(
                color: Colors.purple[900],
                child: Text(
                  'Pay now',
                  style: TextStyle(color: Colors.yellow),
                ),
                onPressed: () {
                  openCheckout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final String userID = auth.currentUser.uid;
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('track_n_go')
        .doc('user_info')
        .collection('user_details')
        .doc(userID);
    await docRef.get().then((querySnapshot) {
      PhoneNumber = querySnapshot.get('phone_number');
      Email = querySnapshot.get('email');
      Amount = querySnapshot.get('price');
    });

    setState(() {
      dataarrived = true;
    });
  }
}
