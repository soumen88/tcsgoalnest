import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_screen_events.freezed.dart';

///flutter pub run build_runner build --delete-conflicting-outputs
@freezed
sealed class OrdersScreenEvents with _$OrdersScreenEvents{
  const factory OrdersScreenEvents.loadCurrentLocation() = LoadCurrentLocationEvent;
  const factory OrdersScreenEvents.changeLocation(String locationName) = ChangeLocationEvent;
  const factory OrdersScreenEvents.placeOrderOnServer() = PlaceOrderOnServerEvent;
}