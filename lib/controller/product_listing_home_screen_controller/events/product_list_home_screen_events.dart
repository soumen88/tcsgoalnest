import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/core/utils/filter_enum.dart';
import 'package:tcsgoalnest/data/models/goal_model.dart';
import 'package:tcsgoalnest/data/models/goal_type_model.dart';

part 'product_list_home_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class ProductListHomeScreenEvents with _$ProductListHomeScreenEvents{
  const factory ProductListHomeScreenEvents.loadProductsFromServer() = LoadProductsFromServerEvent;
  const factory ProductListHomeScreenEvents.filterProducts(FilterEnum filter) = FilterProductsEvent;
  const factory ProductListHomeScreenEvents.startOnBoarding() = StartOnBoardingEvent;
}