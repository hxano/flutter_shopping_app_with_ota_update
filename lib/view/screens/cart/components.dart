import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/data/cart_item.dart';
import '../../common.dart';

SliverList sliverCartScreenHeader(double total) {
  return SliverList(
    delegate: SliverChildListDelegate([
      const Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 30,
          bottom: 20,
        ),
        child: Text(
          'Cart',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Divider(
          color: Colors.grey,
          thickness: 1,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Total:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Consumer(builder: (context, ref, child) {
              return Text(
                ' \$$total',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ],
        ),
      ),
    ]),
  );
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
    required this.onTap,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  final CartItem cartItem;
  final VoidCallback onTap;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final details = cartItem.item;
    final image = details.images.first;
    final title = details.title;
    final size = cartItem.size;
    final quantity = cartItem.quantity;
    final price = details.price * quantity;
    final stock = details.stock[size] ?? 0;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.fill,
                      image: image,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '\$$price',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    size,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  MyQuantityInput(
                    input: quantity,
                    stock: stock,
                    onIncrement: onIncrement,
                    onDecrement: onDecrement,
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: onRemove,
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.grey,
                  size: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 90,
      ),
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text(
          'Check Out',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
