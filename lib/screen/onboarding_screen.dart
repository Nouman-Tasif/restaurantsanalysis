import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurants_app/constants/constatsvalue.dart';

import 'package:restaurants_app/screen/signupscreen.dart';

import '../model/onboardingdatamodel.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      imagePath: 'assets/images/onboarding1.jpeg',
      title: 'Discover Restaurants',
      description: 'Find the best restaurants near you with ease.',
    ),
    OnboardingInfo(
      imagePath: 'assets/images/onboarding2.jpeg',
      title: 'Book a Table',
      description: 'Reserve a table at your favorite restaurant online.',
    ),
    OnboardingInfo(
      imagePath: 'assets/images/onboarding3.jpeg',
      title: 'Order Online',
      description: 'Place orders and get your food delivered quickly.',
    ),
  ];

   OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
        ),
        items: onboardingPages.map((info) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(info.imagePath, height: DynamicSize.height(0.6, context)),
                  const SizedBox(height: 30),
                  Text(
                    info.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      info.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              );
            },
          );
        }).toList(),
      ),
      bottomSheet: Container(
        height: 60,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: TextButton(
            onPressed: () {
              // Navigate to the next screen (e.g., Login or Home screen)
             Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: const Text(
              'Get Started',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


