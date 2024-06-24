import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/constatsvalue.dart';
import '../viewmodel/signup_viewmodel.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formField = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        body: Container(
          height: DynamicSize.height(1, context),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade200, Colors.blue.shade800],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: DynamicSize.width(0.05, context)),
            child: SingleChildScrollView(
              child: Form(
                key: _formField,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: DynamicSize.height(0.15, context)),
                    Center(
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DynamicSize.width(0.08, context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.01, context)),
                    Card(
                      elevation: 5,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: viewModel.username,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: "Full Name",
                            hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Enter full name";
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.01, context)),
                    Card(
                      elevation: 5,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: viewModel.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(fontSize: 15, color: Colors.black54),
                            border: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Enter email";
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.01, context)),
                    Card(
                      elevation: 5,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          obscureText: viewModel.isObscure,
                          controller: viewModel.password,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(fontSize: 15, color: Colors.black54),
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
                                  : Icons.visibility_off, color: Colors.blue.shade800),
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              return null;
                            }
                            return "Enter password";
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.05, context)),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formField.currentState != null && _formField.currentState!.validate()) {
                            viewModel.registerMethod(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          elevation: 10,
                          shadowColor: Colors.blueAccent,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.03, context)),
                    Center(
                      child: Text(
                        "Already have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: DynamicSize.width(0.055, context),
                          fontWeight: FontWeight.normal,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    SizedBox(height: DynamicSize.height(0.03, context)),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(color: Colors.blue.shade800),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue.shade800,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
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
    });
  }
}
