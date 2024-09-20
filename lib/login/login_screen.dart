import 'package:e_commerce_app/login/cubit/login_cubit.dart';
import 'package:e_commerce_app/login/cubit/login_states.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../my_customes/appColors.dart';
import '../my_customes/textFormField.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit,LoginStates>(
      bloc: cubit,
      listener: (context,state){
        if(state is LoginLoadingState){
          DialogUtils.showLoading(context, 'Waiting....');
        }else if(state is LoginErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, content:state.errorMessage,
          title: 'Error',
          posActionName: 'ok');
        }else if(state is LoginSuccessState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, content:'Login Successfully',
              posActionName: 'ok',title: 'Success');
        }
      },

      child: Scaffold(
        backgroundColor: const Color(0xff004182),
        body: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 97.w),
                  child: Image.asset('assets/route.png'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back to Route",
                        style: TextStyle(
                          color: AppColors.WhiteColor,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please sign in with your email",
                          style: TextStyle(color: AppColors.WhiteColor,fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTextFormField(
                  fieldName: 'E-mail address',
                  hintText: 'enter your email address',
                  controller: cubit.emailController,
                  obscureText: false,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter email ';
                    }
                    final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if (!emailValid) {
                      return 'Please enter valid email ';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  fieldName: 'Password',
                  hintText: 'enter your password',
                  controller: cubit.passWordController,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter password';
                    }
                    if (text.length < 6) {
                      return 'Password must be at least 6 chars';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          "Forget Password",
                          style: TextStyle(
                            color: AppColors.WhiteColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                   cubit.login();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue, backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 160, vertical: 20),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff004182),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const InkWell(
                  child: Text(
                    'Do not have an Account ?? create Account ',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
