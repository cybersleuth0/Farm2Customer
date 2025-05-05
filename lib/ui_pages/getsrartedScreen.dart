import 'dart:async';

// Import necessary packages and constants
import 'package:farm2customer/App_Constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Define the GetstartedScreen widget
class GetstartedScreen extends StatefulWidget {
  // Constructor for the GetstartedScreen widget
  const GetstartedScreen({super.key});

  // Create the state for the GetstartedScreen widget
  @override
  State<GetstartedScreen> createState() => GetstartedScreenState();
}

class GetstartedScreenState extends State<GetstartedScreen> {
  @override
  void initState() {
    // Call the superclass's initState method
    super.initState();
    // Set a timer for 3 seconds
    Timer(Duration(seconds: 3), () async {
      // Get an instance of SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Check if the user is already logged in
      if (prefs.getInt(AppConstant.isLogedIN) != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.ROUTE_BASEHOMEPAGE); // Navigate to the base homepage
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.ROUTE_LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return a SafeArea widget
    return SafeArea(
      // Return a Scaffold widget
      child: Scaffold(
        // Set the body of the Scaffold to a Container
        body: Container(
            // Set the decoration for the Container
            decoration: BoxDecoration(
              // Set the image for the decoration
              image: DecorationImage(
                // Load the welcome image from the assets
                image: AssetImage("assets/image/welcome.jpg"),
                // Make the image cover the entire container
                fit: BoxFit.cover,
              ),
            ),
            // Use a Stack widget to layer widgets on top of each other
            child: Stack(
              children: [
                // Align the child widget to the bottom center
                Align(
                  // Set the alignment to bottom center
                  alignment: Alignment.bottomCenter,
                  // Add padding to the child widget
                  child: Padding(
                    // Set the padding values
                    padding: EdgeInsets.only(bottom: 110, left: 20, right: 20),
                    // Use a Column widget to arrange children vertically
                    child: Column(
                      // Set the main axis size to minimal
                      mainAxisSize: MainAxisSize.min,
                      // Set the children of the Column
                      children: [
                        // Display a welcome text
                        Text(
                          "Welcome \n to our store",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontFamily: "Offside", fontSize: 45, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        // Add a SizedBox for spacing
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
