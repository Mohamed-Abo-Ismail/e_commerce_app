import 'package:e_commerce_app/my_customes/MyAssets.dart';
import 'package:e_commerce_app/my_customes/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/model/ProductResponse.dart';

class GridViewCartItem extends StatelessWidget {
  bool isWishListed = false;

  Product product;
  GridViewCartItem({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: Color(0xff004182),
            width: 1,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  product.imageCover ?? "",
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: Color(0xff004182),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: isWishListed == true
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border_rounded),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(product.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff004182),
                    fontWeight: FontWeight.w500)),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  'EGP ${product.price}',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff004182),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w),
            child: Row(
              children: [
                Text(
                  'Review (${product.ratingsAverage})',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff004182),
                  ),
                ),
                SizedBox(
                  width: 7.w,
                ),
                Image.asset('assets/Star.png'),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: Color(0xff004182),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
