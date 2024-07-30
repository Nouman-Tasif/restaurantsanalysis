import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/login_screen.dart';
import '../widgets/toast_message.dart';

class SignUpViewModel with ChangeNotifier {
  final email = TextEditingController();
  bool isObscure = true;
  final username = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  updateStates() {
    notifyListeners();
  }

  Future<void> registerMethod(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email.text.toString(), password: password.text.toString());

      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'username': username.text.toString(),
          'emailVerified': false,
        });

        await user.sendEmailVerification();

        flutterToastMessage("Verification email sent. Please check your inbox.");

        // Logout the user immediately after registration to ensure they verify their email first
        await _auth.signOut();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    } catch (error) {
      flutterToastMessage(error.toString());
    }
    notifyListeners();
  }
}
