import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/favorites/components.dart';

import '../../../viewmodel/favorites_viewmodel.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = ref.watch(favoriteItemListProvider);
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: FavoritesScreenHeader(),
        ),
        SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.25,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = favorites[index];
                return FavoriteItemCard(
                  item: item,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      '/item_details',
                      arguments: item.id,
                    );
                  },
                  onRemove: () {
                    ref.read(favoriteItemListProvider.notifier).toggleFavorite(item);
                  },
                );
              },
              childCount: favorites.length,
            )),
      ],
    );
  }
}
