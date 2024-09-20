import 'package:e_commerce_app/my_customes/textFormField.dart';
import 'package:e_commerce_app/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/register/cubit/register_state.dart';
import 'package:e_commerce_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'RegisterScreen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, 'Loading....');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, content: state.errorMassage,
              posActionName: 'ok',title: 'Error');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, content:'Register Successfully',
          posActionName: 'ok',title: 'Success');

        }
      },
      child: Scaffold(
        body: Container(
          color: const Color(0xff004182),
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 91.h, bottom: 46.h, left: 97.w, right: 50.w),
                  child: Image.asset('assets/route.png'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Form(
                          key: cubit.formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                  fieldName: 'Full Name',
                                  hintText: 'enter your name',
                                  controller: cubit.nameController,
                                  obscureText: false,
                                  validator: (text) {
                                    if (text == null || text.trim().isEmpty) {
                                      return 'Please enter user name';
                                    }
                                    return null;
                                  }),
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
                              CustomTextFormField(
                                fieldName: 'Password',
                                hintText: 'enter your password',
                                controller: cubit.passwordController,
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
                              CustomTextFormField(
                                fieldName: 'Confirm Password',
                                hintText: 'confirm your password',
                                controller: cubit.confirmationPasswordController,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (text != cubit.passwordController.text) {
                                    return 'confirm password does not match the password';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.phone,
                                obscureText: true,
                              ),
                              CustomTextFormField(
                                fieldName: 'Phone number ',
                                hintText: 'Enter your phone number',
                                controller: cubit.phoneController,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                validator: (text) {
                                  if (text == null || text.trim().isEmpty) {
                                    return 'Please enter user name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  cubit.register();
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.blue,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 20),
                                ),
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Color(0xff004182),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
