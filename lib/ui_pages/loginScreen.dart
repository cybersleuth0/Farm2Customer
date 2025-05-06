import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/Bloc/Login/login_bloc.dart';
import 'package:farm2customer/Bloc/Login/login_event.dart';
import 'package:farm2customer/Bloc/Login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Controllers for text fields
  TextEditingController mailControler = TextEditingController();
  TextEditingController passwdControler = TextEditingController();

  // Flag to toggle password visibility
  bool isPasswordVisible = true;

  // Key for the form to validate it
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Flag to indicate if the signup process is currently loading
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SafeArea(
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
                              TextFormField(
                                controller: mailControler,
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
                                ),
                                validator: (inputValue) {
                                  var exp = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                  if (!exp.hasMatch(inputValue!)) {
                                    return "Invalid Email";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
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
                                  ),
                                  validator: (value) {
                                    var exp = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                                    if (value!.isEmpty) {
                                      return "Password field cannot be empty!";
                                    }
                                    if (!exp.hasMatch(value)) {
                                      return """Please include:
                                        - 1 Upper case
                                        - 1 lowercase
                                        - 1 Numeric Number
                                        - 1 Special Character""";
                                    }
                                    return null;
                                  }),
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
                              // BlocListener to listen for state changes in LoginBloc
                              BlocListener<LoginBloc, LoginState>(
                                listener: (context, state) {
                                  if (state is LoginLoading_State) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else if (state is LoginFailure_State) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(
                                              state.errorMSG,
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            duration: Duration(seconds: 3)));
                                  } else if (state is LoginSuccess_State) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              "Registered Successfully!!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            duration: Duration(seconds: 3)));
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.ROUTE_BASEHOMEPAGE);
                                  }
                                },
                                child: Align(
                                  // ElevatedButton for the login button
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff53B175),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 10)),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<LoginBloc>().add(
                                            Login_User_BTNPressed_Event(
                                                mail: mailControler.text,
                                                pass: passwdControler.text));
                                      }
                                    },
                                    child: isLoading
                                        ? Row(children: [
                                            CircularProgressIndicator(),
                                            SizedBox(width: 10),
                                            Text("Login in...",
                                                style: TextStyle(fontSize: 18)),
                                          ])
                                        : const Text(
                                            "Login",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // InkWell for navigating to the signup screen
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AppRoutes.ROUTE_SIGNUP);
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
      ),
    );
  }
}
