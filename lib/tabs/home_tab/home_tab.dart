import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/my_customes/AnnouncementsSection.dart';
import 'package:e_commerce_app/my_customes/categoriesOrBrandsSection.dart';
import 'package:e_commerce_app/my_customes/custom_search_with_shopping_cart.dart';
import 'package:e_commerce_app/my_customes/row_section_widget.dart';
import 'package:e_commerce_app/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:e_commerce_app/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: viewModel..getAllCategories()..getAllBrands(),
      builder: (context, state) {
        return SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Image.asset('assets/Route black.png',
                    color: const Color(0xff004182)),
                SizedBox(
                  height: 18.h,
                ),
                CustomSearchWithShoppingCart(),
                SizedBox(
                  height: 16.h,
                ),
                AnnouncementsSection(),
                SizedBox(
                  height: 16.h,
                ),
                RowSectionWidget(name: 'Categories'),
                SizedBox(
                  height: 24.h,
                ),
                viewModel.categoriesList.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CategoriesOrBrandsSection(list:viewModel.categoriesList,),
                SizedBox(
                  height: 24.h,
                ),
                RowSectionWidget(name: 'Brands'),
                SizedBox(
                  height: 24.h,
                ),
                viewModel.BrandsList.isEmpty?
                    Center(child: CircularProgressIndicator(
                      color: Color(0xff004182),
                    ),)
                :
                CategoriesOrBrandsSection(list:viewModel.BrandsList,),
              ],
            ),
          ),
        ));
      },
    );
  }
}
