import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/data/model/CategoryOrBrandResponse.dart';
import 'package:e_commerce_app/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel() : super(HomeTabInitialState());
  List<CategoryOrBrand> categoriesList = [];
  List<CategoryOrBrand> BrandsList = [];

  void getAllCategories() async {
    try {
      emit(HomeCategoryLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeCategoryErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data ?? [];
        emit(HomeCategorySuccessState(response: response));
      }
    } catch (e) {
      emit(HomeCategoryErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    try {
      emit(HomeBrandsLoadingState());
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeBrandsErrorState(errorMessage: response.message!));
      } else {
        BrandsList = response.data ?? [];
        emit(HomeBrandsSuccessState(response: response));
      }
    } catch (e) {
      emit(HomeBrandsErrorState(errorMessage: e.toString()));
    }
  }
}
