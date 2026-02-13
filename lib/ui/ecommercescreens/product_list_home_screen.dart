import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/events/product_list_home_screen_events.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/product_listing_home_bloc.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/states/product_list_home_screen_states.dart';
import 'package:tcsgoalnest/core/constants/color_constants.dart';
import 'package:tcsgoalnest/core/repository/api_repository.dart';
import 'package:tcsgoalnest/core/routing/app_router.dart';
import 'package:tcsgoalnest/core/utils/filter_enum.dart';
import 'package:tcsgoalnest/core/utils/on_boarding_enum.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_app_bar.dart';
import 'package:tcsgoalnest/ui/commonwidgets/custom_loader.dart';
import 'package:tcsgoalnest/ui/commonwidgets/display_error_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/outline_button_widget.dart';
import 'package:tcsgoalnest/ui/commonwidgets/productlisthome/product_item_widget.dart';

import '../commonwidgets/regular_text_widget.dart';

@RoutePage()
class ProductListHomeScreen extends StatelessWidget {
  final _key = GlobalKey<ExpandableFabState>();
  final OnBoardingEnum onBoardType;


  ProductListHomeScreen({required this.onBoardType});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => ProductListingHomeBloc()..add(ProductListHomeScreenEvents.loadProductsFromServer(onBoardType)),
        child: BlocConsumer<ProductListingHomeBloc, ProductListHomeScreenStates>(
            builder: (BuildContext context, ProductListHomeScreenStates states){
              return states.maybeWhen(
                  productLoadingView: (){
                    return CustomLoader();
                  },
                  productErrorView: (String errorMessage){
                    return DisplayErrorWidget(errorMessage: errorMessage,);
                  },
                  displayProductList: (List<ProductDataModel> productList){
                    return Scaffold(
                      appBar: CustomAppBar(),
                      backgroundColor: ColorConstants.kBlackColor,
                      body: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75
                          ),
                          itemCount: productList.length,
                          itemBuilder: (BuildContext context, int index){
                            ProductDataModel currentProduct = productList[index];
                            return ProductItemWidget(
                              productDetails: currentProduct,
                            );
                          },

                      ),
                      floatingActionButtonLocation: ExpandableFab.location,
                      floatingActionButton: ExpandableFab(
                        key: _key,
                        type: ExpandableFabType.up,
                        childrenAnimation: ExpandableFabAnimation.none,
                        distance: 70,
                        overlayStyle: ExpandableFabOverlayStyle(
                          color: Colors.black.withOpacity(0.9),
                        ),
                        children: [
                          Row(
                            children: [
                              RegularTextWidget(
                                textToDisplay: "Sort by price",
                                textColor: ColorConstants.kWhiteColor,
                              ),
                              SizedBox(width: 20),
                              FloatingActionButton.small(
                                heroTag: null,
                                onPressed: (){
                                  _key.currentState!.close();
                                  BlocProvider.of<ProductListingHomeBloc>(context)
                                      .add(ProductListHomeScreenEvents.filterProducts(FilterEnum.SORT_BY_PRICE));
                                },
                                child: Icon(Icons.monetization_on),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              RegularTextWidget(
                                textToDisplay: "Sort by name",
                                textColor: ColorConstants.kWhiteColor,
                              ),
                              SizedBox(width: 20),
                              FloatingActionButton.small(
                                heroTag: null,
                                onPressed: (){
                                  _key.currentState!.close();
                                  BlocProvider.of<ProductListingHomeBloc>(context).add(ProductListHomeScreenEvents.filterProducts(FilterEnum.SORT_BY_NAME));
                                },
                                child: Icon(Icons.person),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  orElse: (){
                    return DisplayErrorWidget(
                      errorMessage: "Something went wrong! Please try again later",
                    );
                  }
              );
            },
            listener: (BuildContext context, ProductListHomeScreenStates states){
              states.whenOrNull(
                showOnBoardingScreen: (){
                  context.router.replace(const OnBoardingRoute());
                }
              );
            }
        ),
    );
  }
}
