// Abstract class representing the base state for the registration process.
abstract class RegisterState {}

// Represents the initial state of the registration process.
class RegisterInitialState extends RegisterState {}

// Represents the loading state during the registration process.
class RegisterLoadingState extends RegisterState {}

// Represents the successful completion of the registration process.
class RegisterSuccessState extends RegisterState {}

// Represents the failure state of the registration process.
class RegisterFailureState extends RegisterState {
  // Error message associated with the registration failure.
  String errorMSG;
  // Constructor to create a RegisterFailureState instance.
  RegisterFailureState({required this.errorMSG});
}
