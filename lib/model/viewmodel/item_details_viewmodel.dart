import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_shopping_app_with_ota_updates/model/repository/item_details_repository.dart';

import '../data/item_details.dart';

part 'item_details_viewmodel.g.dart';

@riverpod
Future<ItemDetails> itemDetailsFuture(
    ItemDetailsFutureRef ref,
    String id,
    ) async {
  final repository = MockItemDetailsRepository();
  return repository.fetchItemDetails(id);
}