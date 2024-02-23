import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/data/item_details.dart';
import '../repository/item_details_repository.dart';

part 'item_details_viewmodel.g.dart';

@riverpod
Future<ItemDetails> itemDetailsFuture(
    ItemDetailsFutureRef ref,
    String id,
    ) async {
  final repository = MockItemDetailsRepository();
  return repository.fetchItemDetails(id);
}