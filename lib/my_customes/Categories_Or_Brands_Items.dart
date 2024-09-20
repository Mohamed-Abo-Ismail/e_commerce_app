import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/data/model/CategoryOrBrandResponse.dart';
import 'package:e_commerce_app/my_customes/MyAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesOrBrandsItems extends StatelessWidget {
  CategoryOrBrand list;
  CategoriesOrBrandsItems({required this.list});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.cover,
            imageUrl: list.image ?? "",
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: Color(0xff004182),
              ),
            ),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover)),
              );
            },
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              list.name ?? "",
              textWidthBasis: TextWidthBasis.longestLine,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: const Color(0xff004182),
                  fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
