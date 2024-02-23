import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/data/item.dart';
import '../repository/item_repository.dart';
import '../repository/showcase_repository.dart';

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