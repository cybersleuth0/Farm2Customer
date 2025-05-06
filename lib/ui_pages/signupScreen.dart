import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/Bloc/Signup/signup_bloc.dart';
import 'package:farm2customer/Bloc/Signup/signup_event.dart';
import 'package:farm2customer/Bloc/Signup/signup_state.dart';
import 'package:farm2customer/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A StatefulWidget for the user signup screen.
class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => SignupScreenState();
}

/// The state for the SignupScreen widget.
class SignupScreenState extends State<SignupScreen> {
  // Controllers for text fields to manage their text.
  TextEditingController nameControler = TextEditingController();
  TextEditingController mailControler = TextEditingController();
  TextEditingController passwdControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();

  // Flag to toggle password visibility in the password text field.
  bool isPasswordVisible = true;

  // Key for the form to validate the input fields.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Flag to indicate if the signup process is currently loading.
  bool isLoading = false;

  /// Initializes the state of the widget.
  @override
  void initState() {
    super.initState();
    // Clear the text field controllers when the widget is initialized to ensure empty fields on load.
    nameControler.clear();
    phoneControler.clear();
    mailControler.clear();
    passwdControler.clear();
  }

  /// Builds the UI for the signup screen.
  @override
  Widget build(BuildContext context) {
    return Form(
      // Associates the form key with this Form widget.
      key: formKey,
      child: SafeArea(
        // Provides a safe area for content to avoid system overlays like the status bar.
        child: Scaffold(
            // Allows the body to resize when the keyboard appears to prevent elements from being hidden.
            resizeToAvoidBottomInset: true,
            // Sets the background color of the screen.
            backgroundColor: Color(0xfff8f8f6),
            // The main body of the screen, arranged in a vertical column.
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded widget to give the image container flexible space.
                Expanded(
                  flex: 1, // Allocates 1 part of the available vertical space.
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            // Sets the background image.
                            image: AssetImage("assets/image/onflore.jpg"),
                            // Covers the entire container with the image.
                            fit: BoxFit.cover)),
                  ),
                ),
                SizedBox(height: 20), // Adds vertical spacing.
                // Expanded widget to give the content section flexible space.
                Expanded(
                    flex: 3, // Allocates 3 parts of the available vertical space.
                    child: Padding(
                      // Adds horizontal padding to the content.
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      // Allows the content to be scrollable if it overflows vertically.
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Sign Up text title.
                              Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 26, fontFamily: "Gilory_Medium"),
                              ),
                              SizedBox(height: 10), // Adds vertical spacing.
                              // Subtitle text.
                              Text(
                                "Enter Your credentials to continue",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff7C7C7C)),
                              ),
                              SizedBox(height: 30), // Adds vertical spacing.
                              // Name text label.
                              Text(
                                "Name",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10), // Adds vertical spacing.
                              // Name text form field for user input.
                              TextFormField(
                                controller: nameControler, // Links controller.
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
                                // Validator function for input validation.
                                validator: (inputValue) {
                                  if (inputValue!.isEmpty) {
                                    return "Name Filed can not be empty !!";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(height: 20), // Adds vertical spacing.
                              // Mobile Number text label.
                              Text(
                                "Mobile Number",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10), // Adds vertical spacing.
                              // Mobile Number text form field.
                              TextFormField(
                                controller: phoneControler, // Links controller.
                                keyboardType: TextInputType.phone, // Sets keyboard type to phone.
                                maxLength: 10, // Limits input length to 10 characters.
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
                                // Validator for phone number format and length.
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
                              // email text label.
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10), // Adds vertical spacing.
                              // email text form field.
                              TextFormField(
                                keyboardType: TextInputType.emailAddress, // Sets keyboard type to email.
                                  controller: mailControler, // Links controller.
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
                                // Validator for email format.
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
                              SizedBox(height: 20), // Adds vertical spacing.
                              // Password text label.
                              Text(
                                "Password",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: "Gilory_SemiBold",
                                    color: Color(0xff181725)),
                              ),
                              SizedBox(height: 10), // Adds vertical spacing.
                              // password text form field.
                              TextFormField(
                                  controller: passwdControler, // Links controller.
                                  // Toggles password visibility based on the flag.
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
                                    // Suffix icon to toggle password visibility.
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                          setState(() {}); // Updates the UI.
                                        },
                                        child: isPasswordVisible
                                            ? Icon(Icons.visibility)
                                            : Icon(Icons.visibility_off)),
                                  ),
                                  // Validator for password strength and format.
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
                              SizedBox(height: 10), // Adds vertical spacing.
                              // forget password text.
                              Align(
                                alignment: Alignment.centerRight, // Aligns the text to the right.
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
                              ), // Adds vertical spacing.
                              // Terms and condition text.
                              Align(
                                  alignment: Alignment.center, // Aligns the text to the center.
                                  child: Text.rich( // Allows for styled text within a single Text widget.
                                    TextSpan(
                                      text: 'By continuing,you agree to our ',
                                      // Normal text style.
                                      style: TextStyle(
                                          fontFamily: "Gilory_Medium",
                                          fontSize: 16,
                                          color: Colors.black),
                                      children: [
                                        TextSpan(
                                          text: 'Terms of service ',
                                          // Styled text for "Terms of service".
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.lightGreen,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and', // Normal text.
                                        ),
                                        TextSpan(
                                            text: " Privacy policy", // Styled text for "Privacy policy".
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.lightGreen))
                                      ],
                                    ),
                                  )),
                              SizedBox(height: 20), // Adds vertical spacing.
                              //Sign Up button.
                              // BlocListener listens to the state changes of the RegisterBloc
                              BlocListener<RegisterBloc, RegisterState>(
                                listener: (context, state) {
                                  // Handles different states of the RegisterBloc.
                                  if (state is RegisterLoadingState) {
                                    // Shows loading indicator when registering.
                                    setState(() {
                                      isLoading = true;
                                    });
                                  } else if (state is RegisterFailureState) {
                                    // Displays a SnackBar with the error message on registration failure.
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          state.errorMSG,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        duration: Duration(seconds: 3),
                                      ),
                                    );
                                  } else if (state is RegisterSuccessState) {
                                    // Displays a SnackBar on successful registration.
                                    setState(() {
                                      isLoading = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text(
                                              "Registered Successfully!!",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            duration: Duration(
                                                seconds:
                                                    3))); // Adjusted duration
                                    // Navigates to the login screen on success.
                                    Navigator.pushNamed(context, "/login");
                                  }
                                },
                                child: Align(
                                  alignment: Alignment.center, // Aligns the button to the center.
                                  child: ElevatedButton(
                                      // Styles the elevated button.
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xff53B175),
                                        foregroundColor: Colors.white,
                                        padding: EdgeInsets.symmetric(
                                            // add padding between button text and border
                                            horizontal: 100, vertical: 10)),
                                    // Callback function when the button is pressed.
                                    onPressed: () {
                                      // Validate the form before submitting.
                                      if (formKey.currentState!.validate()) {
                                        // Dispatches the RegisterNewUserBTN_Event to the RegisterBloc.
                                        context.read<RegisterBloc>().add(
                                            //event to add new user
                                            RegisterNewUserBTN_Event(
                                                newuser:
                                                    // Create a UserModel from the text field controllers.
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
                                    },
                                    // Shows a loading indicator or the "Sign Up" text based on the isLoading flag.
                                    child: isLoading
                                        ? Row(children: [
                                            CircularProgressIndicator(),
                                            SizedBox(width: 10),
                                            Text("Registering..."),
                                          ])
                                        : const Text("Sign Up"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20), // Adds vertical spacing.
                              // Text and InkWell for navigating to the login screen.
                              InkWell(
                                onTap: () {
                                  // Navigates to the login screen when tapped.
                                  Navigator.pushNamed(context, "/login");
                                },
                                child: Align(
                                    alignment: Alignment.center, // Aligns the text to the center.
                                    child: Text.rich( // Allows for styled text within a single Text widget.
                                      TextSpan(
                                        text: 'Already have an account? ',
                                        style: TextStyle(
                                            fontFamily: "Gilory_Medium",
                                            fontSize: 16,
                                            color: Colors.black),
                                        children: [
                                          TextSpan(
                                            text: 'Sign Up', // Styled text for "Sign Up" (should be "Log In" probably).
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.lightGreen,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                              SizedBox(height: 20), // Adds vertical spacing.
                            ]),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}