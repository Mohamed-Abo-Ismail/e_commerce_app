import 'package:e_commerce_app/data/model/ProductResponse.dart';
import 'package:e_commerce_app/tabs/product_list_tab/cubit/product_tab_states.dart';
import 'package:e_commerce_app/tabs/product_list_tab/cubit/product_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../my_customes/CustomTextField.dart';
import '../../my_customes/Grid_view_cart_item.dart';
import '../../my_customes/MyAssets.dart';
import '../../product_details_view/product_details_view.dart';

class ProductListTab extends StatelessWidget {
  ProductTabViewModel viewModel = ProductTabViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductTabViewModel, ProductTabStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Image.asset(
                'assets/Route blue.png',
                color: Color(0xff004182),
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  Expanded(child: CustomTextField()),
                  SizedBox(
                    width: 24.w,
                  ),
                  InkWell(
                    onTap: () {
                      //Navigator.of(context).pushNamed(CartScreen.routName);
                    },
                    child: Badge(
                      label: Text('1'),
                      child: ImageIcon(
                        AssetImage('assets/icon _shopping cart_.png'),
                        size: 28.sp,
                        color: Color(0xff004182),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24.h),
              viewModel.productList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff004182),
                      ),
                    )
                  : Expanded(
                      child: GridView.builder(
                          itemCount: viewModel.productList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 6/8,
                                  crossAxisSpacing: 16.w,
                                  mainAxisSpacing: 16.h),
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {Navigator.of(context).pushNamed(ProductDetailsView.routName);
                                arguments: viewModel.productList[index];
                              },
                              child:
                              GridViewCartItem(product: viewModel.productList[index],),
                            );
                          }))
            ],
          ),
        ));
      },
    );
  }
}
