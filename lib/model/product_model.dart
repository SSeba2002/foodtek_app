class Product {
  final String id;
  final String name;
  final String description;
  final String cartDescription;
  final String detailedDescription;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final double rating;
  final int reviews;
  int quantity;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.cartDescription,
    required this.detailedDescription ,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    this.rating = 4.5,
    this.reviews = 120,
    this.quantity = 1,
    this.isFavorite = false,
  });

  String get formattedPrice => '${price.toStringAsFixed(2)} JD';

  double get discountPercentage {
    return oldPrice != null ? ((oldPrice! - price) / oldPrice!) * 100 : 0;
  }


Product copyWith({
  bool? isFavorite,
  int? quantity,
  double? rating,  // أضف هذا
  int? reviews,
}) {
  return Product(
    id: id,
    name: name,
    description: description,
    cartDescription: cartDescription,
   detailedDescription :detailedDescription,
    price: price,
    oldPrice: oldPrice,
    imageUrl: imageUrl,
    rating: rating ?? this.rating,
    reviews: reviews ?? this.reviews,
    quantity: quantity ?? this.quantity,
    isFavorite: isFavorite ?? this.isFavorite,
  );
} }