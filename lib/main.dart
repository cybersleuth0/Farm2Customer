// Suggested code may be subject to a license. Learn more: ~LicenseLog:2351871009.
import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/Bloc/Login/login_bloc.dart';
import 'package:farm2customer/Bloc/Signup/signup_bloc.dart';
import 'package:farm2customer/data/local/db_helper.dart';
import 'package:farm2customer/data/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The entry point of the Flutter application.
void main() {
  // Runs the application and sets up the MultiBlocProvider for managing Blocs.
  runApp(MultiBlocProvider(
      // List of BlocProviders to provide different Blocs to the widget tree.
      providers: [
        // Provides the RegisterBloc, initializing it with a UserRepository that uses DBHelper.
        BlocProvider(
            create: (context) => RegisterBloc(
                userRepo: Userrepository(dbConnector: DBHelper.getInstance()))),
        // Provides the LoginBloc, initializing it with a UserRepository that uses DBHelper.
        BlocProvider(
            create: (context) => LoginBloc(
                userRepo: Userrepository(dbConnector: DBHelper.getInstance())))
      ],
      // The root widget of the application, providing material design features.
      child: MaterialApp(
        // Removes the debug banner shown in debug mode.
        debugShowCheckedModeBanner: false,
        // Sets the initial route that the application starts on.
        // AppRoutes.ROUTE_GETSTARTED is defined in the App_Constant/constant.dart file.
        initialRoute: AppRoutes.ROUTE_GETSTARTED,
        // Defines the named routes for the application.
        // AppRoutes.getRoute() likely returns a map of route names to widget builders.
        routes: AppRoutes.getRoute(),
        // Note: While not explicitly asked for in the prompt, it's good practice
        // to also have an `onGenerateRoute` or define specific `home` route
        // for more complex navigation or initial screen setup, but for this
        // example, using `initialRoute` and `routes` map is sufficient based
        // on the provided code structure.
      )));
}
