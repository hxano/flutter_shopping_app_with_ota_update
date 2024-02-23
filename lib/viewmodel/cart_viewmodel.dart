import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/data/cart_item.dart';
import '../repository/order_repository.dart';

part 'cart_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class CartItemList extends _$CartItemList {
  @override
  List<CartItem> build() {
    return [];
  }

  void add(CartItem item) {
    final index = _indexOf(item);
    if (index != -1) {
      final details = state[index].item;
      final stock = details.stock[item.size]!;
      state[index].quantity = min(stock, state[index].quantity + item.quantity);
      state = [...state];
    } else {
      state.add(item);
      state = [...state];
    }
  }

  void remove(CartItem item) {
    state = state.where((element) => element != item).toList();
  }

  void _update(int index, CartItem item) {
    state[index] = item;
    state = [...state];
  }

  /// Returns the index of the same item if it exists in the cart, otherwise returns -1
  int _indexOf(CartItem item) {
    final index = state.indexWhere((element) =>
        element.item.id == item.item.id && element.size == item.size);
    return index;
  }

  void increase(CartItem item) {
    final index = state.indexOf(item);
    final details = item.item;
    if (item.quantity < details.stock[item.size]!) {
      item.quantity++;
      _update(index, item);
    }
  }

  void decrease(CartItem item) {
    final index = state.indexOf(item);
    if (item.quantity > 1) {
      item.quantity--;
      _update(index, item);
    }
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