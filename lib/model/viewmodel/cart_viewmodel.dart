import 'package:flutter_shopping_app_with_ota_updates/model/repository/order_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/cart_item.dart';

part 'cart_viewmodel.g.dart';


@Riverpod(keepAlive: true)
class CartItemList extends _$CartItemList {
  @override
  List<CartItem> build() {
    return [];
  }

  void add(CartItem item) {
    state.add(item);
    state = [...state];
  }

  void remove(CartItem item) {
    state = state.where((element) => element != item).toList();
  }

  void update(int index, CartItem item) {
    state[index] = item;
    state = [...state];
  }

  void checkOut() {
    MockOrderRepository().order(state);
    state = [];
  }

  double getTotal() {
    double result = 0;
    for (CartItem item in state) {
      result += item.total;
    }
    return result;
  }
}