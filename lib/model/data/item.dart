import 'package:flutter/material.dart';

class Item {
  final String id;
  final String category;
  final String brand;
  final int price;
  final ImageProvider thumbnail;
  final double rating;
  final int reviewCount;

  Item({
    required this.id,
    required this.category,
    required this.brand,
    required this.price,
    required this.thumbnail,
    required this.rating,
    required this.reviewCount,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      category: json['category'],
      brand: json['brand'],
      price: json['price'],
      thumbnail: AssetImage(json['thumbnail']),
      rating: json['rating'],
      reviewCount: json['reviewCount'],
    );
  }
}
