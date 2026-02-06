import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/events/product_list_home_screen_events.dart';
import 'package:tcsgoalnest/controller/product_listing_home_screen_controller/states/product_list_home_screen_states.dart';
import 'package:tcsgoalnest/core/dependency/injectable_setup.dart';
import 'package:tcsgoalnest/core/repository/api_repository.dart';
import 'package:tcsgoalnest/core/utils/pretty_logger_util.dart';
import 'package:tcsgoalnest/data/ecommercemodels/product_data_model.dart';

class ProductListingHomeBloc extends Bloc<ProductListHomeScreenEvents, ProductListHomeScreenStates>{
  final _logger = locator<PrettyLoggerUtil>();
  final _TAG = "ProductListingHomeBloc";
  final ApiRepository _apiRepository = ApiRepository();

  ProductListingHomeBloc() : super(const ProductListHomeScreenStates.productLoadingView()){
    on<ProductListHomeScreenEvents>((event, emit) async{
      await event.map(
          loadProductsFromServer: (event) async => await _getProductList(event, emit),
          filterProducts: (event) async => await _filterProductList(event, emit),
      );
    });
  }

  Future<void> _getProductList(LoadProductsFromServerEvent event, Emitter<ProductListHomeScreenStates> emit) async{
    List<ProductDataModel> productListReceived = await _apiRepository.hitServerToGetProducts();
    emit(ProductListHomeScreenStates.displayProductList(productListReceived));
  }

  Future<void> _filterProductList(FilterProductsEvent event, Emitter<ProductListHomeScreenStates> emit) async{

  }

}