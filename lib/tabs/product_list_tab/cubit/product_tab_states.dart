import 'package:e_commerce_app/data/model/ProductResponse.dart';

abstract class ProductTabStates{}
class ProductTabInitialStates extends ProductTabStates{}
class ProductTabLoadingStates extends ProductTabStates{}
class ProductTabErrorStates extends ProductTabStates{
  String errorMessage;
  ProductTabErrorStates({required this.errorMessage});
}
class ProductTabSuccessStates extends ProductTabStates{
  ProductResponse productResponse;
  ProductTabSuccessStates({required this.productResponse});
}