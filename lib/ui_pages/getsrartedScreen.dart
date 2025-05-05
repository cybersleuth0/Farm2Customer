import 'dart:async';

import 'package:farm2customer/App_Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetstartedScreen extends StatefulWidget {
  const GetstartedScreen({super.key});

  @override
  State<GetstartedScreen> createState() => GetstartedScreenState();
}

class GetstartedScreenState extends State<GetstartedScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.getInt(AppConstant.isLogedIN) != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.ROUTE_BASEHOMEPAGE);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.ROUTE_LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/welcome.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  // Aligns content to the bottom center
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 110, left: 20, right: 20),
                    // Responsive padding
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // Keeps the column size minimal
                      children: [
                        Text(
                          "Welcome \n to our store",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Offside",
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Get your groceries in as fast as ten min",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Offside",
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
