import 'package:farm2customer/ui_pages/BottomNavigation/Explore.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/HomePage.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/allitems.dart';
import 'package:farm2customer/ui_pages/basehomepage.dart';
import 'package:farm2customer/ui_pages/getsrartedScreen.dart';
import 'package:farm2customer/ui_pages/loginScreen.dart';
import 'package:farm2customer/ui_pages/signUpScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {

  static const String ROUTE_GETSTARTED = "/getstarted";
  static const String ROUTE_LOGIN = "/login";
  static const String ROUTE_SIGNUP = "/signup";
  static const String ROUTE_BASEHOMEPAGE = "/basehomepage";
  //below this are navigation pages
  static const String ROUTE_HOME = "/homepageNavigation";
  static const String ROUTE_EXPLORE = "/explorePageNavigation";
  static const String ROUTE_ALLITEMS = "/allItems";

  static Map<String, WidgetBuilder> getRoute() => {
        ROUTE_GETSTARTED: (context) => GetstartedScreen(),
        ROUTE_LOGIN: (context) => LoginScreen(),
        ROUTE_SIGNUP: (context) => SignupScreen(),
        ROUTE_BASEHOMEPAGE: (context) => Basehomepage(),
        ROUTE_HOME: (context) => HomePageNavigation(),
        ROUTE_EXPLORE: (context) => ExplorePageNavigation(),
        ROUTE_ALLITEMS: (context) => AllItems(),
      };
}

class AppConstant {
  static const String isLogedIN = "is_login";
}