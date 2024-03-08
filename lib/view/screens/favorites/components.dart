import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/main.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';

import '../../../model/data/item.dart';

class FavoritesScreenHeader extends StatelessWidget {
  const FavoritesScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 60,
        left: 30,
        bottom: 20,
      ),
      child: Text(
        'Favorites',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FavoriteItemCard extends ConsumerWidget {
  const FavoriteItemCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onRemove,
  });

  final Item item;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ab = ref.watch(abTestProvider);
    return Stack(
      children: [
        ab ? ItemThumbnailCardA(
          item: item,
          onTap: onTap,
        ) : ItemThumbnailCardB(
          item: item,
          onTap: onTap,
        ),
        _HeartButton(
          onTap: onRemove,
        ),
      ],
    );
  }
}

class _HeartButton extends StatelessWidget {
  const _HeartButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: InkWell(
          onTap: onTap,
          child: const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.favorite,
              color: Colors.pinkAccent,
            ),
          ),
        ),
      ),
    );
  }
}
