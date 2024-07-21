import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:restaurants_app/constants/constatsvalue.dart';
import 'package:restaurants_app/screen/signupscreen.dart';

import '../model/onboardingdatamodel.dart';

class OnboardingScreen extends StatelessWidget {
  final List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      imagePath: 'assets/images/chicken_tikka.jpg',
      title: 'Discover Restaurants',
      description: 'Find the best restaurants near you with ease.',
    ),
    OnboardingInfo(
      imagePath: 'assets/images/onboarding3.jpeg',
      title: 'Book a Table',
      description: 'Reserve a table at your favorite restaurant online.',
    ),
    OnboardingInfo(
      imagePath: 'assets/images/onboarding2.jpeg',
      title: 'Order Online',
      description: 'Place orders and get your food delivered quickly.',
    ),
  ];

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.orangeAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: CarouselSlider(
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
                            SizedBox(
                              height: DynamicSize.height(0.6, context),
                              width: DynamicSize.width(0.99, context),
                              child: Image.asset(
                                info.imagePath,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
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
              ),
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child:  Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 30.0,
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the next screen (e.g., Login or Home screen)
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen( )),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'GET STARTED',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.arrow_forward, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
