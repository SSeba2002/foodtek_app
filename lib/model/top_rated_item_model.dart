class RecommendedItem {
  final int id;
  final String nameAr;
  final String nameEn;
  final String descriptionAr;
  final String descriptionEn;
  final double price;
  final double itemRate;
  final String image;

  RecommendedItem({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.price,
    required this.itemRate,
    required this.image,
  });

  factory RecommendedItem.fromJson(Map<String, dynamic> json) {
    return RecommendedItem(
      id: json['id'],
      nameAr: json['nameAr']?.toString() ?? '',
      nameEn: json['nameEn']?.toString() ?? '',
      descriptionAr: json['descriptionAr']?.toString() ?? '',
      descriptionEn: json['descriptionEn']?.toString() ?? '',
      price: (json['price'] ?? 0).toDouble(),
      itemRate: (json['itemRate'] ?? 0).toDouble(),
      image: (json['image']?.toString() ?? '').isEmpty
             ? 'assets/images/default_food.png'  // default image
             : json['image'].toString(),
    );
  }
}

