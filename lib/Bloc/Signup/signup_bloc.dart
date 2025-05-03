import 'package:farm2customer/data/repository/userRepository.dart';
import 'package:farm2customer/Bloc/Signup/signup_event.dart';
import 'package:farm2customer/Bloc/Signup/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({required Userrepository userRepo})
      : super(RegisterInitialState()) { // Initial state of the bloc
    
    // Event handler for RegisterNewUserBTN_Event
    on<RegisterNewUserBTN_Event>((event, emit) async {
      
      emit(RegisterLoadingState()); // Emitting loading state
      
      // Checking if the user is already in the database
      if (await userRepo.isUserAlreadyinDB(newMail: event.newuser.user_email)) {
        emit(RegisterFailureState(errorMSG: "User Already Exist")); // Emitting failure state if user already exists
      } else {
        // Registering the new user
        bool isSuccess = await userRepo.registerNewUser(newuser: event.newuser);
        
        // Checking if registration was successful
        if (isSuccess) {
          emit(RegisterSuccessState()); // Emitting success state
        } else {
          emit(RegisterFailureState(errorMSG: "Something Went Wrong")); // Emitting failure state if something went wrong
        }
      }
    }); // End of event handler
  }
}
