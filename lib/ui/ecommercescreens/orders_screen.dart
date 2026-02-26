import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/orders_screen_bloc.dart';
import 'package:tcsgoalnest/controller/order_screen_controller/states/orders_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/core/utils/location_utils.dart';
import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bold_text_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/bottom_navigation_button.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/orders/display_location_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/regular_text_widget.dart';

import '../../controller/order_screen_controller/events/orders_screen_events.dart';
import '../../core/constants/image_constants.dart';
import '../../data/ecommercemodels/location_marker.dart';
import '../../data/ecommercemodels/order_response_model.dart';
import '../../data/ecommercemodels/place_search.dart';
import '../commonwidgets/custom_app_bar.dart';

@RoutePage()
class OrdersScreen extends StatelessWidget {
  final _locationUtils = LocationUtils();
  final _logger = locator<LoggerUtil>();
  final _TAG = "OrdersScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersScreenBloc()..add(LoadCurrentLocationEvent()),
      child: BlocConsumer<OrdersScreenBloc, OrdersScreenStates>(
        listener: (BuildContext context, OrdersScreenStates states) {
          if (states is ErrorView) {}
        },
        builder: (BuildContext context, OrdersScreenStates states) {
          return states.when(
            displayMarkerView: (LocationMarker locationMarker, List<PlaceSearch>? placesList) {
                  return Scaffold(
                    body: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: DisplayLocationWidget(
                              latitude: locationMarker.latitude,
                              longitude: locationMarker.longitude,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BoldTextWidget(textToDisplay: "Place details: "),
                                RegularTextWidget(
                                    textToDisplay: locationMarker.displayLocationName,
                                    textAlignment: TextAlign.center,
                                )
                              ],
                            )
                        )
                      ],
                    ),
                    bottomNavigationBar: SafeArea(
                      child: BottomNavigationButton(
                          buttonCaption: "Proceed to checkout",
                          onButtonPress: () {
                            BlocProvider.of<OrdersScreenBloc>(context).add(OrdersScreenEvents.placeOrderOnServer());
                          }
                      ),
                    ),
                  );
                },
            loadingView: () {
              return CustomLoader();
            },
            errorView: (String errorMessage) {
              return DisplayErrorWidget(errorMessage: errorMessage);
            },
            orderPlacedView: (OrderResponseModel orderResponseModel) {
              return Scaffold(
                appBar: CustomAppBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldTextWidget(
                        textToDisplay: "Order placed successfully with order id ${orderResponseModel.orderId}",
                        textAlignment: TextAlign.center,
                        fontSize: 28,
                    ),
                    Lottie.asset(
                      ImageConstants.kSuccessJson,
                      width: 200,
                      height: 200,
                    ),
                    RegularTextWidget(
                        textToDisplay: "Your order will be delivered to you in 2-3 business days"
                    ),
                  ],
                ),
                bottomNavigationBar: SafeArea(
                  child: BottomNavigationButton(
                      buttonCaption: "Go to home",
                      onButtonPress: () {

                        context.router.replace(const EcommerceSplashRoute());
                      }
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
