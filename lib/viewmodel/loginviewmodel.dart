import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screen/forgot_screen.dart';
import '../screen/tabbar_screen.dart';
import '../widgets/toast_message.dart';

class LoginViewModel with ChangeNotifier {
  final email = TextEditingController();
  final password = TextEditingController();
  bool isPasswordCorrect = false;
  bool isObscure = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initialize() {}

  updateStates() {
    notifyListeners();
  }

  void loginMethod(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email.text.toString(), password: password.text.toString());

      User? user = userCredential.user;

      if (user != null && user.emailVerified) {
        isPasswordCorrect = false;
        email.text = "";
        password.text = "";
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const TabScreen()));
      } else if (user != null && !user.emailVerified) {
        flutterToastMessage("Please verify your email before logging in.");
        await _auth.signOut();
      }
    } catch (error) {
      isPasswordCorrect = true;
      flutterToastMessage(error.toString());
    }

    notifyListeners();
  }

  void forgotPasswordNavigation(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
    notifyListeners();
  }
}
