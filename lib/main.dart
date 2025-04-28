import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/Explore.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/HomePage.dart';
import 'package:farm2customer/ui_pages/BottomNavigation/allitems.dart';
import 'package:farm2customer/ui_pages/basehomepage.dart';
import 'package:farm2customer/ui_pages/getsrartedScreen.dart';
import 'package:farm2customer/ui_pages/loginScreen.dart';
import 'package:farm2customer/ui_pages/signUpScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.ROUTE_GETSTARTED,
    routes: AppRoutes.getRoute(),
  ));
}
