import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/item.dart';

part 'favorites_viewmodel.g.dart';


@Riverpod(keepAlive: true)
class FavoriteItemList extends _$FavoriteItemList {
  @override
  List<Item> build() {
    return [];
  }

  void _add(Item item) {
    state.add(item);
    state = [...state];
  }

  void _remove(Item item) {
    state = state.where((element) => element.id != item.id).toList();
  }

  bool isFavorite(Item item) {
    return state.any((element) => element.id == item.id);
  }

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _remove(item);
    } else {
      _add(item);
    }
  }
}