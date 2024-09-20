import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/register/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObscure = true;

  void register() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingState());
        var response = await ApiManager.register
          (emailController.text,
            nameController.text,
            phoneController.text,
            passwordController.text,
            confirmationPasswordController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorState(errorMassage: response.message!));
        } else {
          emit(RegisterSuccessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMassage: e.toString()));
      }
    }
  }
}
