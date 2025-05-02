import 'package:farm2customer/App_Constant/constant.dart';
import 'package:flutter/material.dart';

class GetstartedScreen extends StatefulWidget {
  const GetstartedScreen({super.key});

  @override
  State<GetstartedScreen> createState() => GetstartedScreenState();
}

class GetstartedScreenState extends State<GetstartedScreen> {
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
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20),
                        //get Started button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            //backgroundColor: Colors.orange.shade500,
                            backgroundColor: Color(0xff53b175),
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.ROUTE_SIGNUP);
                          },
                          child: Text("Get Started"),
                        ),
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
