import 'package:flutter/material.dart';
import 'package:track_n_go/screens/components/custom_error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:track_n_go/screens/details_screen.dart';

class MyAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static void signUp(
      String email, String password, BuildContext context) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Navigator.of(context).pushNamed(details.routeName);
    } catch (e) {
      switch (e.code) {
        case 'network-request-failed':
          CustomErrorDialog.getErrorBox(
            context,
            'Please make sure your device has an internet connection',
          );
          break;
        case 'invalid-email':
          CustomErrorDialog.getErrorBox(
            context,
            'Please enter a valid Email Id',
          );
          break;
        case 'email-already-in-use':
          CustomErrorDialog.getErrorBox(
            context,
            'User already exists. Please login.',
          );
          break;
        case 'weak-password':
          CustomErrorDialog.getErrorBox(
            context,
            'Password must be at least six characters long',
          );
          break;
        default:
          CustomErrorDialog.getErrorBox(context, e.message + 'Error');
          break;
      }
    }
  }
}
