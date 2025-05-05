import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  // Controllers for text fields
  TextEditingController nameControler = TextEditingController();
  TextEditingController mailControler = TextEditingController();
  TextEditingController passwdControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();

  // Flag to toggle password visibility
  bool isPasswordVisible = false;

  // Key for the form to validate it

  GlobalKey formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            //use for avoid keyboard overlap from bottom
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
                              //Sign Up text
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 26, fontFamily: "Gilory_Medium"),
                              ),
                              SizedBox(height: 10),
                              Text(
                                //Enter Your credentials to continue text
                                "Enter Your credentials to continue",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff7C7C7C)),
                              ),
                              SizedBox(height: 30),
                              // Name text field
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10),
                              //Name text form field
                              TextFormField(
                                controller: nameControler,
                                decoration: InputDecoration(
                                  hintText: "Enter Name",
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
                                ),
                                validator: (inputValue) {
                                  if (inputValue!.isEmpty) {
                                    return "Name Filed can not be empty !!";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              // Mobile Number text field
                              Text(
                                "Mobile Number",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10),
                              //Mobile Number text form field
                              TextFormField(
                                controller: phoneControler,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: "Enter Number",
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
                                ),
                                validator: (inputValue) {
                                  if (inputValue!.isEmpty) {
                                    return "Name Filed can not be empty !!";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              //email text
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10),
                              // email text field
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                  controller: mailControler,
                                  decoration: InputDecoration(
                                    hintText: "Enter Email",
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2)),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff7C7C7C),
                                    ),
                                  )),
                              SizedBox(height: 20),
                              // Password text
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10),
                              // password text field
                              TextField(
                                  controller: passwdControler,
                                  obscureText: !isPasswordVisible,
                                  decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blueAccent,
                                            width: 2)),
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xff7C7C7C),
                                    ),
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                          setState(() {});
                                        },
                                        child: isPasswordVisible
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                  )),
                              SizedBox(height: 10),
                              // forget password text
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
                              SizedBox(
                                height: 10,
                              ),
                              // Terms and condition text
                              Align(
                                  alignment: Alignment.center,
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'By continuing,you agree to our ',
                                      // Normal text
                                      style: TextStyle(
                                          fontFamily: "Gilory_Medium",
                                          fontSize: 16,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'Terms of service ',
                                          // Styled text
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and',
                                        ),
                                        TextSpan(
                                            text: " Privacy policy",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.lightGreen))
                                      ],
                                    ),
                                  )),
                              SizedBox(height: 20),
                              //Sign Up button
                              Align(
                                alignment: Alignment.center,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xff53B175),
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 100, vertical: 10)),
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Gilory_SemiBold"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              //already have account text
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text.rich(
                                      TextSpan(
                                        text: 'Already have an account? ',
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
      ),
    );
  }
}
