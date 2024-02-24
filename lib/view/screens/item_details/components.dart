import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_app_with_ota_updates/view/common.dart';

class ItemDetailsBackButton extends StatelessWidget {
  const ItemDetailsBackButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black.withOpacity(0.2),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkWell(
        onTap: onTap,
        child: const Icon(
          Icons.navigate_before_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}

class ItemDetailsImages extends StatelessWidget {
  const ItemDetailsImages({super.key, required this.images});

  final List<ImageProvider> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        viewportFraction: 1,
        enableInfiniteScroll: false,
        height: MediaQuery.of(context).size.height * 0.4,
      ),
      itemBuilder: (context, index, realIndex) {
        return Image(
          image: images[index],
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        );
      },
    );
  }
}

class ItemDetailsInfo extends StatelessWidget {
  const ItemDetailsInfo({
    super.key,
    required this.title,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.isFavorite,
    required this.onHeartTap,
  });

  final String title;
  final String brand;
  final String category;
  final double rating;
  final int reviewCount;
  final double price;
  final bool isFavorite;
  final VoidCallback onHeartTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "$brand / $category",
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              Text(
                rating.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '($reviewCount)',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                _HeartButton(
                  isFavorite: isFavorite,
                  onTap: onHeartTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: const Text(
        'Description',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(description),
        ),
      ],
    );
  }
}

class QuantityInputTile extends StatelessWidget {
  const QuantityInputTile({
    super.key,
    required this.input,
    required this.stock,
    required this.onIncrement,
    required this.onDecrement,
  });

  final int input;
  final int stock;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListTile(
        leading: const Text('Quantity'),
        title: MyQuantityInput(
          input: input,
          stock: stock,
          onIncrement: onIncrement,
          onDecrement: onDecrement,
        ),
      ),
    );
  }
}

class _HeartButton extends StatelessWidget {
  const _HeartButton({
    required this.isFavorite,
    required this.onTap,
  });

  final bool isFavorite;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        color: Colors.pinkAccent,
        size: 30,
      ),
      onPressed: onTap,
    );
  }
}

class SizeSelectionTile extends StatelessWidget {
  const SizeSelectionTile({
    super.key,
    required this.size,
    required this.quantity,
    required this.stock,
    required this.onSizeChanged,
  });

  final String size;
  final int quantity;
  final Map<String, int> stock;
  final ValueChanged<String> onSizeChanged;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Size',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(size),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: stock.keys
                .map(
                  (e) => ListTile(
                    title: Text(e,
                      style: TextStyle(
                          color: stock[e]! >= quantity
                              ? Colors.black
                              : Colors.grey[400],
                        ),
                    ),
                    trailing: Text(
                      stock[e].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      if (stock[e]! >= quantity) {
                        onSizeChanged(e);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
