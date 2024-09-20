import 'package:e_commerce_app/data/api_manager.dart';
import 'package:e_commerce_app/tabs/product_list_tab/cubit/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/ProductResponse.dart';

class ProductTabViewModel extends Cubit<ProductTabStates>{
  ProductTabViewModel():super(ProductTabInitialStates());
  List<Product> productList = [];


  void getAllProducts()async{
    try{
      emit(ProductTabLoadingStates());
      var response = await ApiManager.getAllProducts();
      if(response.statusMsg =='fail'){
        emit(ProductTabErrorStates(errorMessage: response.message!));
      }else{
        productList = response.data ?? [];
        emit(ProductTabSuccessStates(productResponse: response));
      }
    }catch(e){
      emit(ProductTabErrorStates(errorMessage: e.toString()));
    }
  }
}