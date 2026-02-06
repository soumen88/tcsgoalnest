import 'package:dio/dio.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';

class ApiRepository {
  final dio = Dio();
  final _logger = locator<LoggerUtil>();
  final _TAG = "ApiRepository";

  Future<List<ProductDataModel>> hitServerToGetProducts() async{
    try{
      Response response;
      response = await dio.get('${AppConstants.kBaseUrl}${AppConstants.kGetAllProductsEndpoint}');
      List<ProductDataModel> productList = [];
      switch(response.statusCode){
        case 200:
          List<dynamic> productListFromServer = response.data;
          for(var individualProducts in productListFromServer){
            ProductDataModel currentProduct = ProductDataModel.fromJson(individualProducts);
            String imagePath = currentProduct.assetImagePath.substring(currentProduct.assetImagePath.lastIndexOf("/"), currentProduct.assetImagePath.length);
            imagePath = imagePath.replaceAll("/","");
            imagePath = imagePath.replaceAll("jpg","png");
            int calcDiscountedPrice = (currentProduct.price - ( currentProduct.price * (currentProduct.discount / 100))).round();
            _logger.log(TAG: _TAG, message: "Image path after substring $imagePath");
            currentProduct = currentProduct.copyWith(
              assetImagePath: imagePath,
              discountedPrice: calcDiscountedPrice
            );
            //_logger.log(TAG: _TAG, message: "Individual products $currentProduct");

            productList.add(currentProduct);
          }
          break;
        case 404:

          break;
        case 501:

          break;
      }
      return Future.value(productList);
    }
    catch(exception, stackTrace){
      _logger.log(TAG: _TAG, message: "Exception occurred $exception and $stackTrace");
      return Future.error("Something went wrong $exception");
    }
  }
}