import 'package:e_commerce_app/data/model/response/LoginResponse.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginErrorState extends LoginStates {
  String errorMessage;
  LoginErrorState({required this.errorMessage});
}

class LoginSuccessState extends LoginStates {
  LoginResponse response;
  LoginSuccessState({required this.response});
}
