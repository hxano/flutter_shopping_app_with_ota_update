import 'package:flutter/material.dart';

class ItemDetails {
  final String id;
  final String category;
  final String brand;
  final double price;
  final List<ImageProvider> images;
  final String title;
  final String description;
  final double rating;
  final int reviewCount;
  final List<String> size;
  final Map<String, int> stock;

  ItemDetails({
    required this.id,
    required this.category,
    required this.brand,
    required this.price,
    required this.images,
    required this.title,
    required this.description,
    required this.rating,
    required this.reviewCount,
    required this.size,
    required this.stock,
  });

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    final stock = json['stock'] as Map<String, dynamic>;
    return ItemDetails(
      id: json['id'],
      category: json['category'],
      brand: json['brand'],
      price: double.parse(json['price']),
      images: List<ImageProvider>.from(
        (json['images'] as List<dynamic>).map(
          (e) => AssetImage(e as String),
        ),
      ),
      title: json['title'],
      description: json['description'],
      rating: double.parse(json['rating']),
      reviewCount: int.parse(json['reviewCount']),
      size: List<String>.from(json['size']),
      stock: Map<String, int>.from(
        stock.map(
          (key, value) => MapEntry(key, int.parse(value as String)),
        ),
      ),
    );
  }
}