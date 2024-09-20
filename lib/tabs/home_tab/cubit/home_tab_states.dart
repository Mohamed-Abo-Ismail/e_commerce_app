import 'package:e_commerce_app/data/model/CategoryOrBrandResponse.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeCategoryLoadingState extends HomeTabStates {}

class HomeCategoryErrorState extends HomeTabStates {
  String errorMessage;
  HomeCategoryErrorState({required this.errorMessage});
}

class HomeCategorySuccessState extends HomeTabStates {
  CategoryOrBrandResponse response;
  HomeCategorySuccessState({required this.response});
}

class HomeBrandsLoadingState extends HomeTabStates {}

class HomeBrandsErrorState extends HomeTabStates {
  String errorMessage;
  HomeBrandsErrorState({required this.errorMessage});
}

class HomeBrandsSuccessState extends HomeTabStates {
  CategoryOrBrandResponse response;
  HomeBrandsSuccessState({required this.response});
}
