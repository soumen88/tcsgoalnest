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
        int trackIdReceived = await _box.put(cartTrackerData);
        _logger.log(TAG: _TAG, message: "Cart with id $trackIdReceived has been added to the cart");
    }

    Future<void> removeFromCart(int cartId) async {
        bool isRemoved = await _box.remove(cartId);
        _logger.log(TAG: _TAG, message: "Cart with id $cartId has been removed from the cart: ${isRemoved ? "Yes" : "No"}");
    }

    Stream<List<CartTrackerData>> listenToCart(int productId) async* {
        final query = _box.query(CartTrackerData_.productId.equals(productId));
        final Stream<Query<CartTrackerData>> queryToWatch = query.watch(triggerImmediately: true);
        Stream<List<CartTrackerData>> rowsInStream = queryToWatch.map((query) => query.find());
        yield* rowsInStream;
    }
}