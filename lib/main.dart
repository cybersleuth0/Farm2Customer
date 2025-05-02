import 'package:farm2customer/App_Constant/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.ROUTE_GETSTARTED,
    routes: AppRoutes.getRoute(),
  ));
}
