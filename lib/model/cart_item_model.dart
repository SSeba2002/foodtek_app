import 'package:foodtek_project/model/top_rated_item_model.dart';

class CartItem {
  final int id;
  final String title;
  final String image;
  final double price;
  final double rating;
  final String description;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
    this.quantity = 1,
  });

  factory CartItem.fromTopRatedItem(RecommendedItem item) {
    return CartItem(
      id: item.id ?? 0,
      title: item.nameEn ?? '',
      image: item.image ?? '',
      price: item.price ?? 0.0,
      rating: item.itemRate ?? 0.0,
      description: item.descriptionEn ?? '',
    );
  }
}
