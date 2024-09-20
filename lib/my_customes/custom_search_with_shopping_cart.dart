import 'package:e_commerce_app/my_customes/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchWithShoppingCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField()),
        SizedBox(width: 24.w,),
        InkWell(
          onTap: (){},
          child: ImageIcon(
            const AssetImage('assets/icon _shopping cart_.png'),
            size: 28.sp,
            color: const Color(0xff004182),
          ),
        )
      ],
    );
  }

}