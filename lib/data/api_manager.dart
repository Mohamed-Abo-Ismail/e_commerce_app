import 'dart:convert';
import 'package:e_commerce_app/data/end_points.dart';
import 'package:e_commerce_app/data/model/CategoryOrBrandResponse.dart';
import 'package:e_commerce_app/data/model/ProductResponse.dart';
import 'package:e_commerce_app/data/model/request/LoginRequest.dart';
import 'package:e_commerce_app/data/model/request/RegisterRequest.dart';
import 'package:e_commerce_app/data/model/response/LoginResponse.dart';
import 'package:e_commerce_app/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  static Future<RegisterResponse> register(String email, String name,
      String phone, String password, String rePassword) async {
    Uri url = Uri.https(baseUrl, EndPoints.SignUp);
    var registerRequest = RegisterRequest(
        email: email,
        name: name,
        password: password,
        phone: phone,
        rePassword: rePassword);
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return RegisterResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.Login);
    LoginRequest loginRequest = LoginRequest(email: email, password: password);
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);
      var response = await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllBrands);
      var response = await http.get(url);
      return CategoryOrBrandResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getAllProducts);
      var response = await http.get(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
