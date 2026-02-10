import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';
import 'package:tcsgoalnest/data/models/goal_categories_model.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';

import '../../../data/models/goal_type_model.dart';

part 'product_list_home_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class ProductListHomeScreenStates with _$ProductListHomeScreenStates{
  const factory ProductListHomeScreenStates.productLoadingView() = DisplayProductLoadingView;
  const factory ProductListHomeScreenStates.productErrorView(String errorMessage) = DisplayProductErrorView;
  const factory ProductListHomeScreenStates.displayProductList(List<ProductDataModel> productList) = DisplayProductList;
  const factory ProductListHomeScreenStates.showOnBoardingScreen() = ShowOnBoardingScreen;
}