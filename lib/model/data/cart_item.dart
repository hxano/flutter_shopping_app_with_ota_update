import 'item_details.dart';

class CartItem {
  final ItemDetails item;
  String size;
  int quantity;

  CartItem({
    required this.item,
    required this.size,
    required this.quantity,
  });

  double get total => item.price * quantity;
}
