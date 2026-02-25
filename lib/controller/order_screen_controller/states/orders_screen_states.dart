import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tcsgoalnest/data/ecommercemodels/location_marker.dart';

import '../../../data/ecommercemodels/place_search.dart';

part 'orders_screen_states.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class OrdersScreenStates with _$OrdersScreenStates{
  const factory OrdersScreenStates.displayMarkerView(LocationMarker locationMarker, List<PlaceSearch>? placesList) = DisplayLoadingView;
  const factory OrdersScreenStates.loadingView() = LoadingView;
  const factory OrdersScreenStates.errorView(String errorMessage) = ErrorView;
}