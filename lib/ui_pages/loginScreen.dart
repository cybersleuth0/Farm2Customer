import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xfff8f8f6),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/image/onflore.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Loging",
                              style: TextStyle(
                                  fontSize: 26, fontFamily: "Gilory_Medium"),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Enter Your email and password",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Gilory_SemiBold",
                                  color: Color(0xff7C7C7C)),
                            ),
                            SizedBox(height: 30),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "Gilory_SemiBold",
                                  color: Color(0xff181725)),
                            ),
                            SizedBox(height: 10),
                            TextField(
                                decoration: InputDecoration(
                              hintText: "Enter Email",
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.green, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blueAccent, width: 2)),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                color: Color(0xff7C7C7C),
                              ),
                            )),
                            SizedBox(height: 20),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontFamily: "Gilory_SemiBold",
                                  color: Color(0xff181725)),
                            ),
                            SizedBox(height: 10),
                            TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent, width: 2)),
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff7C7C7C),
                                  ),
                                  suffixIcon:
                                      Icon(Icons.remove_red_eye_outlined),
                                )),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget password",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Gilory_Medium",
                                    color: Color(0xff181725)),
                              ),
                            ),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff53B175),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 10)),
                                onPressed: () {
                                  //use are using pushNamedAndRemoveUntil for on pressing the back we do not want to go on back page we should exit the app
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    "/basehomepage",
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "Gilory_SemiBold"),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Don’t have an account? ',
                                      // Normal text
                                      style: TextStyle(
                                          fontFamily: "Gilory_Medium",
                                          fontSize: 16,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'Sign Up', // Styled text
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            SizedBox(height: 20),
                          ]),
                    ),
                  ))
            ],
          )),
    );
  }
}
