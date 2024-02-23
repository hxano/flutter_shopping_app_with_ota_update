import '../model/data/cart_item.dart';

abstract class OrderRepository {
  Future<void> order(List<CartItem> items);
}

class MockOrderRepository implements OrderRepository {
  @override
  Future<void> order(List<CartItem> items) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
