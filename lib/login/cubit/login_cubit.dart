import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/login/cubit/login_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'mohamedesmaile6@gmail.com');
  var passWordController = TextEditingController(text: '123456');
  bool isObscure= true;

  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
            emailController.text, passWordController.text);
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
        } else {
          emit(LoginSuccessState(response: response));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
