import 'package:farm2customer/Bloc/Login/login_event.dart';
import 'package:farm2customer/Bloc/Login/login_state.dart';
import 'package:farm2customer/data/repository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// LoginBloc manages the state of the login process.
// It extends Bloc and uses LoginEvent and LoginState to define its behavior.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  // Constructor for LoginBloc.
  // It takes a UserRepository as a required dependency to handle user login logic.
  // The initial state is set to LoginInitial_State.
  LoginBloc({required Userrepository userRepo}) : super(LoginInitial_State()) {
    // Register a handler for the Login_User_BTNPressed_Event.
    // This handler is triggered when the login button is pressed.
    on<Login_User_BTNPressed_Event>((event, emit) async {
      // Emit LoginLoading_State to indicate that the login process is in progress.
      emit(LoginLoading_State());
      if (await userRepo.loginuser(newMail: event.mail, newPass: event.pass)) {
        emit(LoginSuccess_State());
      } else {
        emit(LoginFailure_State(errorMSG: "Invalid Credentials !!"));
      }
    });
  }
}