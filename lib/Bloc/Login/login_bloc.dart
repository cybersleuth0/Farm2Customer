import 'package:farm2customer/Bloc/Login/login_event.dart';
import 'package:farm2customer/Bloc/Login/login_state.dart';
import 'package:farm2customer/data/repository/userRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required Userrepository userRepo}) : super(LoginInitial_State()) {
    on<Login_User_BTNPressed_Event>((event, emit) async {
      emit(LoginLoading_State());
      if (await userRepo.loginuser(newMail: event.mail, newPass: event.pass)) {
        emit(LoginSuccess_State());
      } else {
        emit(LoginFailure_State(errorMSG: "Invalid Credentials !!"));
      }
    });
  }
}