class OfferModel {
  final int id;
  final String titleEn;
  final String titleAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;

  OfferModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.image,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      id: json['id'] ?? 0,
      titleEn: json['titleEn']?? '',
      titleAr: json['titleAr']?? '',
      descriptionEn: json['descriptionEn']?? '',
      descriptionAr: json['descriptionAr']??'',
      image: (json['image']?.toString() ?? '').isEmpty
             ? 'assets/images/home/sushi.png'  // default image
             : json['image'].toString(),
             
    );
  }
}
