import '../data/item_details.dart';

abstract class ItemDetailsRepository {
  Future<ItemDetails> fetchItemDetails(String productId);
}

class MockItemDetailsRepository implements ItemDetailsRepository {
  @override
  Future<ItemDetails> fetchItemDetails(String productId) async {
    switch (productId) {
      case '1':
        return Future.delayed(
          const Duration(milliseconds: 500),
          () {
            return ItemDetails.fromJson(
              {
                'id': '1',
                'category': 'Sneakers',
                'brand': 'Victoria',
                'price': '150.0',
                'images': ['assets/images/sneakers.png'],
                'title': 'Air Flutter 90',
                'description':
                    'Sporty and comfortable running shoes featuring Air cushioning technology for excellent cushioning and support.',
                'rating': '4.5',
                'reviewCount': '98',
                'size': ['25.0cm', '25.5cm', '26.0cm', '26.5cm', '27.0cm'],
                'stock': {
                  '25.0cm': '5',
                  '25.5cm': '3',
                  '26.0cm': '2',
                  '26.5cm': '1',
                  '27.0cm': '4',
                },
              },
            );
          },
        );
      case '2':
        return Future.delayed(
          const Duration(milliseconds: 500),
          () {
            return ItemDetails.fromJson(
              {
                'id': '2',
                'category': 'Handbag',
                'brand': 'Linus Torvalds',
                'price': '1400.0',
                'images': ['assets/images/handbag.png'],
                'title': 'Linuxfull MM',
                'description':
                    'A simple and elegant design tote bag with a spacious interior and a detachable pouch.',
                'rating': '4.8',
                'reviewCount': '12',
                'size': ['Width 32cm × Height 29cm × Depth 16cm'],
                'stock': {'Width 32cm × Height 29cm × Depth 16cm': '5'},
              },
            );
          },
        );
      case '3':
        return Future.delayed(
          const Duration(milliseconds: 500),
          () {
            return ItemDetails.fromJson(
              {
                'id': '3',
                'category': 'Dress Shirt',
                'brand': 'Brooks Sisters',
                'price': '80.0',
                'images': ['assets/images/dress_shirt.png'],
                'title': 'Non-Iron Flutter Fit Dress Shirt',
                'description':
                    'An elegant shirt made from wrinkle-resistant fabric, featuring a modern and tailored fit.',
                'rating': '4.3',
                'reviewCount': '120',
                'size': ['S', 'M', 'L'],
                'stock': {'S': '5', 'M': '3', 'L': '2'},
              },
            );
          },
        );
      default:
        throw Exception('Product $productId not found');
    }
  }
}
