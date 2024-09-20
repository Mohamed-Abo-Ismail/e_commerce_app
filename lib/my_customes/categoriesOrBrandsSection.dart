import 'package:e_commerce_app/data/model/CategoryOrBrandResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Categories_Or_Brands_Items.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  List<CategoryOrBrand> list;
  CategoriesOrBrandsSection({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoriesOrBrandsItems(list:list[index],);
          }),
    );
  }
}
