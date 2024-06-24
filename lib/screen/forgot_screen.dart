import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/login_screen.dart';

import '../constants/constatsvalue.dart';
import '../viewmodel/forgot_viewmodel.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Container(
            height: DynamicSize.height(1, context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.blue.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: DynamicSize.height(0.15, context)),
                      Center(
                        child: Text(
                          "Forgot Password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: DynamicSize.width(0.065, context),
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.only(top: 20, start: 10),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                      SizedBox(height: DynamicSize.height(0.02, context)),
                      Card(
                        elevation: 8,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextFormField(
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle:  TextStyle(
                                  fontSize: 16, color: Colors.black54),
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.email, color: Colors.blue),
                            ),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return null;
                              }
                              return "Enter your email";
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: DynamicSize.height(0.1, context)),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              viewModel.resetPassword(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Reset Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: DynamicSize.height(0.03, context)),
                      Center(
                        child: Text(
                          "Remember your password?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: DynamicSize.width(0.055, context),
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(height: DynamicSize.height(0.03, context)),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LoginScreen())); // Go back to the login screen
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: const BorderSide(color: Colors.blue),
                            ),
                            elevation: 5,
                            shadowColor: Colors.black,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
