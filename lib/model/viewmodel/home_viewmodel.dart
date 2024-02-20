import 'package:flutter/material.dart';
import 'package:flutter_shopping_app_with_ota_updates/model/repository/item_repository.dart';
import 'package:flutter_shopping_app_with_ota_updates/model/repository/showcase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/item.dart';

part 'home_viewmodel.g.dart';

@riverpod
Future<List<ImageProvider>> showcaseContentsFuture(
    ShowcaseContentsFutureRef ref,
    ) async {
  final repository = MockShowcaseRepository();
  return repository.fetchShowcaseContents();
}

@riverpod
Future<List<Item>> recommendItemsFuture(
    RecommendItemsFutureRef ref,
    ) async {
  final repository = MockItemRepository();
  return repository.fetchRecommendItems();
}