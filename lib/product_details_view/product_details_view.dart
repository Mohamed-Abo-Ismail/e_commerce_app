import 'package:e_commerce_app/data/model/ProductResponse.dart';
import 'package:e_commerce_app/my_customes/MyAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatefulWidget {
  static String routName = "ProductDetailsView";

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text('Product details'),
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xff004182),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20.sp,
            color: Color(0xff004182),
            fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: Colors.grey, width: 2)),
                child: Image.asset(
                  MyAssets.announcement1 as String,
                  fit: BoxFit.cover,
                  height: 300.h,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 18.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'EGP ${args.price}',
                    style: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: Color(0xff004182),
                            width: 1,
                          )),
                      child: Text(
                        'Sold ${args.sold} ',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.grey,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Image.asset('assets/star-2.png'),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('${args.ratingsAverage}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Color(0xff004182),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ))
                ],
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                    color: Color(0xff004182),
                    borderRadius: BorderRadius.circular(100.r)),
                child: Row(
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          size: 28.sp,
                        )),
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: Colors.white,
                          size: 28.sp,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text('Description',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Color(0xff004182),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      )),
              SizedBox(
                height: 10.h,
              ),
              ReadMoreText(
                args.description ?? "",
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: Color(0xff004182).withOpacity(0.6),
                    ),
                trimCollapsedText: 'Show More',
                trimExpandedText: 'Show Less',
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff004182),
                    ),
                lessStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff004182),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 120.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Price',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 18.sp,
                              color: Color(0xff004182),
                            ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'EGP${args.price}',
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 18.sp,
                            color: Color(0xff004182),
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff004182),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.add_shopping_cart_outlined),
                        Text('Add to Cart',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                ))
                      ],
                    ),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
