class RecommendedItem {
  final int id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final double price;
  final String? image;

  RecommendedItem({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.price,
    this.image,
  });

  factory RecommendedItem.fromJson(Map<String, dynamic> json) {
    return RecommendedItem(
      id: json['id'],
      nameEn: json['nameEn']?.toString() ?? '',
      nameAr: json['nameAr']?.toString() ?? '',
      descriptionEn: json['descriptionEn']?.toString() ?? '',
      descriptionAr: json['descriptionAr']?.toString() ?? '',
      price: (json['price'] ?? 0).toDouble(),
      image: (json['image']?.toString() ?? '').isEmpty
             ? 'assets/images/default2_food.png'  // default image
             : json['image'].toString(),
             
    );
  }
}
