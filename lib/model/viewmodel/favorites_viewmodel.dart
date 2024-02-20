import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/item.dart';

part 'favorites_viewmodel.g.dart';


@Riverpod(keepAlive: true)
class FavoriteItemList extends _$FavoriteItemList {
  @override
  List<Item> build() {
    return [];
  }

  void add(Item item) {
    state.add(item);
    state = [...state];
  }

  void remove(Item item) {
    state = state.where((element) => element != item).toList();
  }

  void update(int index, Item item) {
    state[index] = item;
    state = [...state];
  }
}