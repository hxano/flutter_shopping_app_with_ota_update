import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_shopping_app_with_ota_updates/model/data/cart_item.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/screens/item_details/components.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';

import '../../../viewmodel/cart_viewmodel.dart';
import '../../../viewmodel/favorites_viewmodel.dart';
import '../../../viewmodel/item_details_viewmodel.dart';

class ItemDetailsScreen extends ConsumerStatefulWidget {
  const ItemDetailsScreen({super.key, required this.id});

  final String id;

  @override
  ConsumerState<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends ConsumerState<ItemDetailsScreen> {
  int quantity = 1;
  bool isOutOfStock = false;
  String size = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncValueItemDetails =
        ref.watch(ItemDetailsFutureProvider(widget.id));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            asyncValueItemDetails.when(
              data: (details) {
                if (size.isEmpty) {
                  size = details.size.first;
                }
                isOutOfStock = details.isOutOfStock(size, quantity);
                return Consumer(
                  builder: (context, ref, child) {
                    ref.watch(favoriteItemListProvider);
                    final notifier = favoriteItemListProvider.notifier;
                    final isFavorite = ref.read(notifier).isFavorite(
                      details.toItem(),
                    );
                    return ListView(
                      children: [
                        ItemDetailsImages(images: details.images),
                        ItemDetailsInfo(
                          title: details.title,
                          brand: details.brand,
                          category: details.category,
                          rating: details.rating,
                          reviewCount: details.reviewCount,
                          price: details.price,
                          isFavorite: isFavorite,
                          onHeartTap: () {
                            ref.read(notifier).toggleFavorite(
                              details.toItem(),
                            );
                          },
                        ),
                        ItemDescription(description: details.description),
                        QuantityInputTile(
                          input: quantity,
                          stock: details.stock[size] ?? 0,
                          onIncrement: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          onDecrement: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                        ),
                        SizeSelectionTile(
                          size: size,
                          quantity: quantity,
                          stock: details.stock,
                          onSizeChanged: (value) {
                            setState(() {
                              size = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    );
                  }
                );
              },
              error: (error, stackTrace) {
                return const Center(
                  child: Text('Error'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ItemDetailsBackButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.grey.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.purpleAccent,
                      ),
                      onPressed: !isOutOfStock ? () async {
                        if (asyncValueItemDetails.value != null) {
                          ref.read(cartItemListProvider.notifier).add(
                                CartItem(
                                  item: asyncValueItemDetails.value!,
                                  size: size,
                                  quantity: quantity,
                                ),
                              );
                          Navigator.of(context).pop();
                        }
                      } : null,
                      child: const Text('Add to cart'),
                    ),
                    ElevatedButton(
                      onPressed: !isOutOfStock ? () {
                        if (asyncValueItemDetails.value != null) {
                          showDialog(
                              context: context,
                              barrierColor: Colors.transparent,
                              builder: (BuildContext context) {
                                return thankYouDialog(context);
                              });
                        }
                      } : null,
                      child: const Text('Buy now'),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
