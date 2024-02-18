import '../../enum.dart';
import '../data/item.dart';

abstract class ItemRepository {
  Future<List<Item>> search(
    String keyword, {
    String? category,
    String? brand,
    int? minPrice,
    int? maxPrice,
    SortBy? sortBy = SortBy.highestRating,
  });

  Future<List<Item>> fetchRecommendItems();
}

class MockItemRepository implements ItemRepository {
  @override
  Future<List<Item>> search(
    String keyword, {
    String? category,
    String? brand,
    int? minPrice,
    int? maxPrice,
    SortBy? sortBy = SortBy.highestRating,
  }) async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return <Item>[
          Item.fromJson(
            {
              'id': '1',
              'category': 'Sneakers',
              'brand': 'Victoria',
              'price': 150,
              'thumbnail': 'assets/images/sneakers.png',
              'rating': 4.5,
              'reviewCount': 98,
            },
          ),
          Item.fromJson(
            {
              'id': '2',
              'category': 'Handbag',
              'brand': 'Linus Torvalds',
              'price': 1400,
              'thumbnail': 'assets/images/handbag.png',
              'rating': 4.8,
              'reviewCount': 12,
            },
          ),
          Item.fromJson(
            {
              'id': '3',
              'category': 'Dress Shirt',
              'brand': 'Brooks Sisters',
              'price': 80,
              'thumbnail': 'assets/images/dress_shirt.png',
              'rating': 4.3,
              'reviewCount': 120,
            },
          ),
        ];
      },
    );
  }

  @override
  Future<List<Item>> fetchRecommendItems() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () {
        return <Item>[
          Item.fromJson(
            {
              'id': '3',
              'category': 'Dress Shirt',
              'brand': 'Brooks Sisters',
              'price': 80,
              'thumbnail': 'assets/images/dress_shirt.png',
              'rating': 4.3,
              'reviewCount': 120,
            },
          ),
        ];
      },
    );
  }
}
