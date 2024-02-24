import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';

import 'package:flutter_shopping_app_with_ota_updates/view/screens/cart/components.dart';

import '../../../viewmodel/cart_viewmodel.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartItemListProvider);
    return CustomScrollView(
      slivers: [
        sliverCartScreenHeader(
          ref.read(cartItemListProvider.notifier).getTotal(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = cart[index];
              return CartItemCard(
                cartItem: item,
                onIncrement: () {
                  ref.read(cartItemListProvider.notifier).increase(item);
                },
                onDecrement: () {
                  ref.read(cartItemListProvider.notifier).decrease(item);
                },
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/item_details',
                    arguments: item.item.id,
                  );
                },
                onRemove: () {
                  ref.read(cartItemListProvider.notifier).remove(item);
                },
              );
            },
            childCount: cart.length,
          ),
        ),
        // elevated check out button
        SliverToBoxAdapter(
          child: cart.isNotEmpty
              ? CheckOutButton(onTap: () {
                  ref.read(cartItemListProvider.notifier).checkOut();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return thankYouDialog(context);
                      });
                })
              : const SizedBox(),
        ),
      ],
    );
  }
}
