import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff004182),
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
          foregroundColor:
              selectedIndex == 0 ? Color(0xff004182) : Colors.white,
          backgroundColor:
              selectedIndex == 0 ? Colors.white : Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage('assets/white home icon.png'),
          ),
        ),
          label: 'home'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
              selectedIndex == 1 ? Color(0xff004182) : Colors.white,
              backgroundColor:
              selectedIndex == 1 ? Colors.white : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage('assets/white catagory icon.png'),
              ),
            ),
            label: 'catagory'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
              selectedIndex == 2 ? Color(0xff004182) : Colors.white,
              backgroundColor:
              selectedIndex == 2 ? Colors.white : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage('assets/white favourite icon.png'),
              ),
            ),
            label: 'favourite'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor:
              selectedIndex == 3 ? Color(0xff004182) : Colors.white,
              backgroundColor:
              selectedIndex == 3 ? Colors.white : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage('assets/white profile icon.png'),
              ),
            ),
            label: 'profile'),
      ],
    ),
  );
}
