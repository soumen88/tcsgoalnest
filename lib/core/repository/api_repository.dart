import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/network/dio_utils.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';
import 'package:tcsgoalnest/data/ecommercemodels/put_order_request_model.dart';
import 'package:tcsgoalnest/data/ecommercemodels/order_item_model.dart';
import 'package:http/http.dart' as http;

import '../../data/ecommercemodels/order_response_model.dart';
import '../../data/ecommercemodels/users_response_model.dart';

class ApiRepository {
  late Dio dio;
  final _logger = locator<LoggerUtil>();
  final _TAG = "ApiRepository";

  Future<List<ProductDataModel>> hitServerToGetProducts() async{
      dio = await DioUtils().getDioInstance();
      List<ProductDataModel> productList = [];
      await dio.get(AppConstants.kGetAllProductsEndpoint).then((response) {
        _logger.log(TAG: _TAG, message: "Response: ${response.data}");
        List<dynamic> productListFromServer = response.data;
        for(var individualProducts in productListFromServer){
          ProductDataModel currentProduct = ProductDataModel.fromJson(individualProducts);
          String imagePath = currentProduct.assetImagePath.substring(currentProduct.assetImagePath.lastIndexOf("/"), currentProduct.assetImagePath.length);
          imagePath = imagePath.replaceAll("/","");
          imagePath = imagePath.replaceAll("jpg","png");
          int calcDiscountedPrice = (currentProduct.price - ( currentProduct.price * (currentProduct.discount / 100))).round();
          currentProduct = currentProduct.copyWith(
            assetImagePath: imagePath,
            discountedPrice: calcDiscountedPrice
          );
          productList.add(currentProduct);
        }

      }).catchError((error) {
        _logger.log(TAG: _TAG, message: "Error: ${error.response?.data}");
      });
      return Future.value(productList);
  }

  Future<OrderResponseModel> hitServerToPlaceOrder(PutOrderRequestModel putOrderRequestModel) async{
    dio = await DioUtils().getDioInstance();
    
    return await dio.put(AppConstants.kPlaceOrderEndpoint, data: putOrderRequestModel.toJson()).then((response) {
      _logger.log(TAG: _TAG, message: "Response: ${response.data}");
      OrderResponseModel orderResponseModel = OrderResponseModel.fromJson(response.data);
      return Future.value(orderResponseModel);
    }).onError((error, stackTrace) {
      _logger.log(TAG: _TAG, message: "Error: ${error} and stacktrace $stackTrace");
      return Future.error("Failed to place order");
    });

  }

  Future<List<UsersResponseModel>> hitServerToGetUsers() async{
    dio = await DioUtils().getDioInstance();
    return await dio.get(AppConstants.kGetUserEndpoint).then((response) {
      _logger.log(TAG: _TAG, message: "Response: ${response.data}");
      List<dynamic> usersListFromServer = response.data;
      List<UsersResponseModel> usersList = [];
      for(var individualUser in usersListFromServer){
        UsersResponseModel currentUser = UsersResponseModel.fromJson(individualUser);
        //_logger.log(TAG: _TAG, message: "Current user: ${currentUser.userId} ${currentUser.username} ${currentUser.email} ${currentUser.password}");
        usersList.add(currentUser);
      }
      return Future.value(usersList);
    }).onError((error, stackTrace) {
      _logger.log(TAG: _TAG, message: "Error: ${error} and stacktrace $stackTrace");
      return Future.error("Failed to get user");
    });
  }
}