import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: const Color(0xff004182),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.h),
        hintText: 'What do you search for ? ',
        hintStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
          color: const Color.fromRGBO(6, 0, 9, 0.6)
        ),
        prefixIcon: IconButton(
          icon:Icon(
            Icons.search,
            size: 32.sp,
            color:const Color(0xff004182).withOpacity(0.75),
          ),
          onPressed:(){},
        ),
      ),
    );
  }

}