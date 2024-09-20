import 'package:e_commerce_app/my_customes/MyAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementsSection extends StatefulWidget {
  @override
  State<AnnouncementsSection> createState() => _AnnouncementsSectionState();
}

class _AnnouncementsSectionState extends State<AnnouncementsSection> {
  List<Image> sliderImages = [
    MyAssets.announcement1 ,
    MyAssets.announcement2 ,
    MyAssets.announcement3 ,
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      indicatorColor: const Color(0xff004182),
      indicatorBackgroundColor: Colors.white,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages.map((url) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            fit: BoxFit.fill ,
            url as String,
            width: 300.w,
            height: 200.h,
          ),
        );
      }).toList(),
    );
  }
}
