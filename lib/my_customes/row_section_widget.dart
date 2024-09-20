import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSectionWidget extends StatelessWidget {
  String name;
  RowSectionWidget({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: TextStyle(
              color: const Color(0xff004182),
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            )),
        InkWell(
          onTap: () {},
          child: Text(
            'View All',
            style: TextStyle(
                color: const Color(0xff004182),
                fontSize: 15.sp,
                fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
