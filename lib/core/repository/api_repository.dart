import 'package:dio/dio.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/network/dio_utils.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';

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
}