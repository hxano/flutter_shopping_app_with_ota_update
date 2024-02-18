import 'item_details.dart';

class CartItem {
  final ItemDetails item;
  final String size;
  final int quantity;

  CartItem({
    required this.item,
    required this.size,
    required this.quantity,
  });

  int get total => item.price * quantity;
}