import 'package:flutter/material.dart';
import 'appColors.dart';

typedef MyValidator = String? Function(String?);

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String fieldName;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  String? Function(String?) validator;
  final IconButton? suffixIcon; // Add this property

  CustomTextFormField({
    required this.hintText,
    required this.fieldName,
    required this.controller,
    this.keyboardType = TextInputType.text,
    required this.obscureText,
    required this.validator,
    this.suffixIcon, // Initialize the suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, bottom: 4.0),
          child: Text(
            fieldName,
            style: TextStyle(
              color: AppColors.WhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextFormField(
            style: TextStyle(color: AppColors.BackgrounddarkColor),
            decoration: InputDecoration(
              hintText: hintText,
              filled: true, // Added to make the background white
              fillColor: Colors.white, // Set background color to white
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              errorMaxLines: 2,
              suffixIcon: suffixIcon, // Use suffixIcon here
            ),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
