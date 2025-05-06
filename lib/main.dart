// Suggested code may be subject to a license. Learn more: ~LicenseLog:2351871009.
import 'package:farm2customer/App_Constant/constant.dart';
import 'package:farm2customer/Bloc/Login/login_bloc.dart';
import 'package:farm2customer/Bloc/Signup/signup_bloc.dart';
import 'package:farm2customer/data/local/db_helper.dart';
import 'package:farm2customer/data/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  //run application and Multiblocprovider for manage all the blocs
  runApp(MultiBlocProvider(
      providers: [
        //initialize the registerbloc provider with user repo and database
        BlocProvider(
            create: (context) => RegisterBloc(
                userRepo: Userrepository(dbConnector: DBHelper.getInstance()))),
        BlocProvider(
            create: (context) => LoginBloc(
                userRepo: Userrepository(dbConnector: DBHelper.getInstance())))
      ],
      //material app is the main class for flutter application
      child: MaterialApp(
        //remove debug banner from app
        debugShowCheckedModeBanner: false,
        //set initial route for application
        initialRoute: AppRoutes.ROUTE_GETSTARTED,
        //define all the route for application
        routes: AppRoutes.getRoute(),
      )));
}
