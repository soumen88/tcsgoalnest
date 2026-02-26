import 'package:tcsgoalnest/core/utils/logger_util.dart';
import 'package:injectable/injectable.dart';
import '../../objectbox.g.dart';
import '../schema/cart_tracker_data.dart';
import '../utils/logger_util.dart';

@lazySingleton
class CartStoreManager {
    final Box<CartTrackerData> _box;
    final _logger = LoggerUtil();
    final _TAG = "CartStoreManager";

    CartStoreManager(Store objectBoxStore) : _box = objectBoxStore.box<CartTrackerData>();


    Future<void> addToCart(CartTrackerData cartTrackerData) async {
        var existingCartItem = _box.query(CartTrackerData_.productId.equals(cartTrackerData.productId)).build().findFirst();
        if(existingCartItem != null) {
            existingCartItem.quantity = cartTrackerData.quantity;
            await _box.put(existingCartItem);
            _logger.log(TAG: _TAG, message: "Cart with id ${existingCartItem.cartId} has been updated in the cart with quantity ${existingCartItem.quantity}");
        } else {
            int trackIdReceived = await _box.put(cartTrackerData);
            _logger.log(TAG: _TAG, message: "Cart with id $trackIdReceived has been added to the cart with quantity ${cartTrackerData.quantity}");
        }  
    }

    Future<void> removeFromCart(int cartId) async {
        bool isRemoved = await _box.remove(cartId);
        _logger.log(TAG: _TAG, message: "Cart with id $cartId has been removed from the cart: ${isRemoved ? "Yes" : "No"}");
    }

    Future<void> clearCart() async {
        await _box.removeAll();
        _logger.log(TAG: _TAG, message: "Cart has been cleared");
    }

    Future<(double, int)> getTotalPrice() async {
        double totalPrice = 0.0;
        int totalQuantity = 0;
        final query = _box.query().build();
        List<CartTrackerData> cartItems = query.find();
        for(CartTrackerData cartItem in cartItems) {
            totalPrice += cartItem.price * cartItem.quantity;
            totalQuantity += cartItem.quantity;
        }
        query.close();
        return (totalPrice, totalQuantity);
    }

    Future<List<CartTrackerData>> getCartItems() async {
        final query = _box.query().build();
        List<CartTrackerData> cartItems = query.find();
        query.close();
        return cartItems;
    }

    Stream<List<CartTrackerData>> listenToCart(int productId) async* {
        final query = _box.query(CartTrackerData_.productId.equals(productId));
        final Stream<Query<CartTrackerData>> queryToWatch = query.watch(triggerImmediately: true);
        Stream<List<CartTrackerData>> rowsInStream = queryToWatch.map((query) => query.find());
        yield* rowsInStream;
    }

    Stream<List<CartTrackerData>> listenToAllProductsInCart() async* {
        final query = _box.query();
        final Stream<Query<CartTrackerData>> queryToWatch = query.watch(triggerImmediately: true);
        Stream<List<CartTrackerData>> rowsInStream = queryToWatch.map((query) => query.find());
        yield* rowsInStream;
    }
}