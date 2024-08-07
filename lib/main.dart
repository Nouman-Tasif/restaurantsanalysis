
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/splashscreen.dart';


import 'package:restaurants_app/screen/tabbar_screen.dart';
import 'package:restaurants_app/viewmodel/forgot_viewmodel.dart';
import 'package:restaurants_app/viewmodel/loginviewmodel.dart';
import 'package:restaurants_app/viewmodel/restaurantlist_viewmodel.dart';
import 'package:restaurants_app/viewmodel/signup_viewmodel.dart';
import 'package:restaurants_app/viewmodel/tabbar_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBQoUWANr9htsFMxDPRGuUelU-LbcUS5wc",
          appId: "1:481176292310:web:c2490b9a3eb358afffb277",
          messagingSenderId: "481176292310",
          projectId: "restaurantapp-ecb4c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (context) => TabScreenViewModel()),
        ChangeNotifierProvider(create: (context) => RestaurantListViewModel()),
      ],
      child:   MaterialApp(
        color: Color(0xffF1F4FC),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
