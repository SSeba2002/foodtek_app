// lib/models/explore_item_model.dart
class ExploreItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  ExploreItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });


  String get formattedPrice => '${price.toStringAsFixed(2)} JD';

}