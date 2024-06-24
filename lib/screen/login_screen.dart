import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/signupscreen.dart';

import '../constants/constatsvalue.dart';
import '../viewmodel/loginviewmodel.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Stack(
            children: [
              // Gradient Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                  ),
                ),
              ),
              // Login Form
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: DynamicSize.height(0.15, context)),
                        Center(
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: DynamicSize.width(0.055, context),
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.only(top: 20, start: 10),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(height: DynamicSize.height(0.02, context)),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              controller: viewModel.email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
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
                        const Padding(
                          padding:
                              EdgeInsetsDirectional.only(top: 20, start: 10),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                        SizedBox(height: DynamicSize.height(0.02, context)),
                        Card(
                          elevation: 4,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              obscureText: viewModel.isObscure,
                              controller: viewModel.password,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: const TextStyle(
                                    fontSize: 15, color: Colors.black),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    viewModel.isObscure = !viewModel.isObscure;
                                    viewModel.updateStates();
                                  },
                                  child: Icon(viewModel.isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                              ),
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  return null;
                                }
                                return "Enter your password";
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: DynamicSize.height(0.02, context)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.forgotPasswordNavigation(context);
                            },
                            child: const Center(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: DynamicSize.height(0.07, context)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState != null &&
                                  _formKey.currentState!.validate()) {
                                viewModel.loginMethod(context);
                              }
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(vertical: 16.0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.blue, Colors.purple],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxWidth: double.infinity, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: DynamicSize.height(0.03, context)),
                        Center(
                          child: Text(
                            "Don't have an account?",
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
                                      builder: (context) => SignUpScreen()));
                            },
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(vertical: 16.0)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(color: Colors.white),
                                ),
                              ),
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Container(
                                constraints: const BoxConstraints(
                                    maxWidth: double.infinity, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
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
            ],
          ),
        );
      },
    );
  }
}
