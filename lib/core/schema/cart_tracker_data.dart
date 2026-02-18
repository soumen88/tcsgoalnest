import 'package:objectbox/objectbox.dart';

@Entity()
class CartTrackerData {
    @Id()
    int cartId;
    int productId;
    int quantity;
    double price;
    DateTime addedToCartAt;
    String productName;
    String productImage;
    String productDescription;
    String productCategory;

    CartTrackerData({
        this.cartId = 0,
        required this.productId,
        required this.quantity,
        required this.price,
        required this.addedToCartAt,
        required this.productName,
        required this.productImage,
        required this.productDescription,
        required this.productCategory,
    });

    @override
    String toString() {
        return "CartTrackerData(cartId: $cartId, productId: $productId, quantity: $quantity, price: $price, addedToCartAt: $addedToCartAt, productName: $productName, productImage: $productImage, productDescription: $productDescription, productCategory: $productCategory)";
    }
}