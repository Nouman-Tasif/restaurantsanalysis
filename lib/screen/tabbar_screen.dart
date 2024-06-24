
import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:restaurants_app/screen/Order_Screen.dart';
import 'package:restaurants_app/screen/Profile_screen.dart';
import 'package:restaurants_app/screen/booking_screen.dart';
import 'package:restaurants_app/screen/restaurantslistscreen.dart';

import '../viewmodel/tabbar_viewmodel.dart';



class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenViewModel>(
      builder: (context, viewModel, _) {
        return PersistentTabView(
          context,
          controller: viewModel.tabController,
          screens:  const[
             RestaurantsScreen(),
             OrderScreen(),
            BookingScreen(),
            ProfileScreen(), // New tab
          ],
          items: [
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.restaurant),
              title: 'Restaurants',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.timelapse_sharp),
              title: 'Order',
              activeColorPrimary: Colors .blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.calendar_month),
              title: 'Booking',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
            PersistentBottomNavBarItem(
              icon: const Icon(Icons.person),
              title: 'Profile',
              activeColorPrimary: Colors.blue,
              inactiveColorPrimary: Colors.grey,
            ),
          ],
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 400),
          ),
          navBarStyle:
          NavBarStyle.style11, // Choose the style that suits your needs
        );
      },
    );
  }
}
