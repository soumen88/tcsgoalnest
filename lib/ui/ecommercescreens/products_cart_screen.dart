import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/annotations.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';

import '../../core/dependency/injectable_setup.dart';
import '../../core/schema/cart_tracker_data.dart';
import '../../core/table/cart_store_manager.dart';
import '../commonwidgets/bold_text_widget.dart';
import '../commonwidgets/carts/cart_list_item_widget.dart';
import '../commonwidgets/custom_app_bar.dart';
import '../commonwidgets/custom_loader.dart';
import '../commonwidgets/display_error_widget.dart';
import '../commonwidgets/carts/cart_summary_widget.dart';
@RoutePage()
class ProductsCartScreen extends StatelessWidget {
  
  
  final _cartStoreManager = locator<CartStoreManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: StreamBuilder<List<CartTrackerData>>(
        stream: _cartStoreManager.listenToAllProductsInCart(),
        builder: (BuildContext context, AsyncSnapshot<List<CartTrackerData>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CustomLoader();
          }
          else if (snapshot.hasError) {
            return DisplayErrorWidget(
              errorMessage: snapshot.error.toString(),
            );
          } 
          else if (snapshot.hasData) {
            List<CartTrackerData> listOfProductsInCart = snapshot.data ?? [];
            return ListView.builder(
              itemCount: listOfProductsInCart.length,
              itemBuilder: (BuildContext context, int index) {
                CartTrackerData currentProduct = listOfProductsInCart[index];
                return CartListItemWidget(cartTrackerData: currentProduct);
              },
            );
          }
          else{
            return DisplayErrorWidget(
              errorMessage: AppConstants.kCommonErrorMessage,
            );
          }
        },
      ),
      bottomNavigationBar: SafeArea(
          child: CartSummaryWidget(
            moveToNextScreen: (){
              context.router.navigate(const OrdersRoute());
            },
          )
      ),
    );
  }
}