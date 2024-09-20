import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String errorMassage;
  RegisterErrorState({required this.errorMassage});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}
