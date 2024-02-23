import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../enum.dart';
import '../model/data/item.dart';
import '../repository/item_repository.dart';

part 'search_viewmodel.g.dart';

@Riverpod(keepAlive: true)
class SearchItemList extends _$SearchItemList {
  @override
  Future<List<Item>> build() async {
    return <Item>[];
  }

  Future<void> search(
    String keyword, {
    String? category,
    String? brand,
    double? minPrice,
    double? maxPrice,
    SortBy? sortBy,
  }) async {
    final repository = MockItemRepository();
    final result = await repository.search(
      keyword,
      category: category,
      brand: brand,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortBy: sortBy,
    );
    state = AsyncData(result);
  }
}
