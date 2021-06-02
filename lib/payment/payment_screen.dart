import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:lottie/lottie.dart';



// ignore: camel_case_types
class payment extends StatefulWidget {
  static const routeName = '/payment';
  const payment({Key key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  static const platfrom = const MethodChannel("razorpzy_flutter");

  Razorpay _razorpay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
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
      "key":"rzp_test_Qs38n2LORuU2Eh",
      "amount": num.parse(textEditingController.text)*100,
      "name" : "Track_n_Go",
      "description" : "Payment",
      "timeout" : 120,
      "prefill" : {
        "contact" : "9686374957",
        "email" : "1si18cs098@sit.ac.in",
      },
      "external" : {
        "wallets":["paytm"]
      }
    };

    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint('Error: e');
    }

  }

  void handlerPaymentSucess() {
    print("Payment success");
    Toast.show("Payment Success",context);
    _razorpay.clear();
  }

  void handlerErrorFailure() {
    print("Payment success");
    Toast.show("Payment Failure",context);
    _razorpay.clear();
  }

  void handlerExternalWallet() {
    print("External wallet");
    Toast.show("External Wallet",context);
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: Text('Add Money to Wallet',style: TextStyle(color: Colors.yellow),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Lottie.asset('assets/wallet.json', height: 200,),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: "Enter the amount"
              ),
            ),
            SizedBox(height: 12,),
            RaisedButton(
              color: Colors.purple[900],
              child: Text('Pay now',style: TextStyle(color: Colors.yellow),),
              onPressed: () {
                openCheckout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
