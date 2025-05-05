import 'package:farm2customer/Bloc/Signup/signup_bloc.dart';
import 'package:farm2customer/Bloc/Signup/signup_event.dart';
import 'package:farm2customer/Bloc/Signup/signup_state.dart';
import 'package:farm2customer/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool isPasswordVisible = true;

  // Key for the form to validate it
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
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
                              //Enter Your credentials to continue text
                              Text(
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
                              // Mobile Number text
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
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: "Enter Phone Number",
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
                                    return "Phone Number can not be empty !!";
                                  }
                                  if (inputValue.length != 10) {
                                    return "Please enter a valid number";
                                  }
                                  return null;
                                },
                              ),
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
                              TextFormField(
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
                              BlocListener<RegisterBloc, RegisterState>(
                                listener: (context, state) {
                                  if (state is RegisterLoadingState) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else if (state is RegisterFailureState) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(state.errorMSG)));
                                  } else if (state is RegisterSuccessState) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Registered Successfully!!")));
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff53B175),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100, vertical: 10)),
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<RegisterBloc>().add(
                                            RegisterNewUserBTN_Event(
                                                newuser:
                                                    UserModel(
                                                        user_name: nameControler
                                                            .text
                                                            .trim(),
                                                        user_email:
                                                            mailControler.text
                                                                .trim(),
                                                        user_password:
                                                            passwdControler.text
                                                                .trim(),
                                                        user_phone:
                                                            phoneControler.text
                                                                .trim())));
                                      }
                                      print(isLoading);
                                    },
                                    child: isLoading
                                        ? Row(children: [
                                            CircularProgressIndicator(),
                                            SizedBox(width: 10),
                                            Text("Loading..."),
                                          ])
                                        : const Text("Sign Up"),
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
