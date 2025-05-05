import 'package:farm2customer/ui_pages/BottomNavigation/Explore.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/HomePage.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/allitems.dart';
import 'package:farm2customer/ui_pages/basehomepage.dart';
import 'package:farm2customer/ui_pages/getsrartedScreen.dart';
import 'package:farm2customer/ui_pages/loginScreen.dart';
import 'package:farm2customer/ui_pages/signUpScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // Define route names for navigation
  // This route for the Get Started screen
  static const String ROUTE_GETSTARTED = "/getstarted";
  // This route for the Login screen
  static const String ROUTE_LOGIN = "/login";
  // This route for the Sign Up screen
  static const String ROUTE_SIGNUP = "/signup";
  // This route for the Base Home Page screen
  static const String ROUTE_BASEHOMEPAGE = "/basehomepage";
  //below this are navigation pages
  // This route for the Home page navigation screen
  static const String ROUTE_HOME = "/homepageNavigation";
  // This route for the Explore page navigation screen
  static const String ROUTE_EXPLORE = "/explorePageNavigation";
  // This route for the All Items page navigation screen
  static const String ROUTE_ALLITEMS = "/allItems";

  // Method to return a map of route names to widget builders
  static Map<String, WidgetBuilder> getRoute() => {
        // Define the widget to be built for each route
        ROUTE_GETSTARTED: (context) => GetstartedScreen(),
        ROUTE_LOGIN: (context) => LoginScreen(),
        ROUTE_SIGNUP: (context) => SignupScreen(),
        ROUTE_BASEHOMEPAGE: (context) => Basehomepage(),
        // navigation pages route
        ROUTE_HOME: (context) => HomePageNavigation(),
        ROUTE_EXPLORE: (context) => ExplorePageNavigation(),
        ROUTE_ALLITEMS: (context) => AllItems(),
      };
}

class AppConstant {
  // Constant class to store the name of the key for shared preference
  //for login value
  static const String isLogedIN = "is_login";
}