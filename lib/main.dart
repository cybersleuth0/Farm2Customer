import 'package:farm2customer/ui_pages/BottomNavigation/Explore.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/HomePage.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/allitems.dart';
import 'package:farm2customer/ui_pages/basehomepage.dart';
import 'package:farm2customer/ui_pages/getsrartedScreen.dart';
import 'package:farm2customer/ui_pages/loginScreen.dart';
import 'package:farm2customer/ui_pages/signUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/getstarted",
    routes: {
      "/getstarted": (context) => GetstartedScreen(),
      "/login": (context) => LoginScreen(),
      "/signup": (context) => SignupScreen(),
      "/basehomepage": (context) => Basehomepage(),
      //below this are navigation pages
      "/homepageNavigation": (context) => HomePageNavigation(),
      "/explorePageNavigation": (context) => ExplorePageNavigation(),
      "/allItems": (context) => AllItems(),
    },
  ));
}
