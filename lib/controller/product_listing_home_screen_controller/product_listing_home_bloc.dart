import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/events/product_list_home_screen_events.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/states/product_list_home_screen_states.dart';
import 'package:tcsgoalnest/core/constants/app_constants.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/repository/api_repository.dart';
import 'package:tcsgoalnest/core/table/key_value_store_manager.dart';
import 'package:tcsgoalnest/core/utils/filter_enum.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';

class ProductListingHomeBloc extends Bloc<ProductListHomeScreenEvents, ProductListHomeScreenStates>{
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "ProductListingHomeBloc";
  final ApiRepository _apiRepository = ApiRepository();
  List<ProductDataModel> _productListReceived = [];
  final _keyValueStore = locator<KeyValueStoreManager>();

  ProductListingHomeBloc() : super(const ProductListHomeScreenStates.productLoadingView()){
    on<ProductListHomeScreenEvents>((event, emit) async{
      await event.map(
          loadProductsFromServer: (event) async => await _getProductList(event, emit),
          filterProducts: (event) async => await _filterProductList(event, emit),
          startOnBoarding: (event) async => await _startNext(event, emit),
      );
    });
  }

  Future<void> _getProductList(LoadProductsFromServerEvent event, Emitter<ProductListHomeScreenStates> emit) async{
    String? hasUserSignedInBefore =  _keyValueStore.getValue(AppConstants.kHasUserSignedIn);
    if(hasUserSignedInBefore != null && hasUserSignedInBefore == "yes"){
      _productListReceived = await _apiRepository.hitServerToGetProducts();
      emit(ProductListHomeScreenStates.displayProductList(_productListReceived));
    }
    else{
      add(StartOnBoardingEvent());
    }
  }

  Future<void> _filterProductList(FilterProductsEvent event, Emitter<ProductListHomeScreenStates> emit) async{
    emit(ProductListHomeScreenStates.productLoadingView());
    await Future.delayed(Duration(seconds: 3), (){
      List<ProductDataModel> productList = _productListReceived.toList();
      switch(event.filter){

        case FilterEnum.SORT_BY_PRICE:
          ///Sorting prices in ascending order
          productList.sort((a, b) => a.discountedPrice.compareTo(b.discountedPrice),);
          _productListReceived.clear();
          _productListReceived = productList.toList();
          emit(ProductListHomeScreenStates.displayProductList(_productListReceived));
          break;
        case FilterEnum.SORT_BY_NAME:
        ///Sorting names in descending order
          productList.sort((a, b) => b.name.compareTo(a.name),);
          _productListReceived.clear();
          _productListReceived = productList.toList();
          emit(ProductListHomeScreenStates.displayProductList(_productListReceived));
          break;
      }

    });

  }

  Future<void> _startNext(StartOnBoardingEvent event, Emitter<ProductListHomeScreenStates> emit) async{
    emit(ProductListHomeScreenStates.showOnBoardingScreen());
  }

}