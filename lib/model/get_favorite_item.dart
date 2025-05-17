class GetFavoriteItem {
  int? id;
  String? nameEn;
  String? nameAr;
  String? descriptionEn;
  String? descriptionAr;
  double? price;
  String? creationDate;

  GetFavoriteItem(
      {this.id,
        this.nameEn,
        this.nameAr,
        this.descriptionEn,
        this.descriptionAr,
        this.price,
        this.creationDate});

  GetFavoriteItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    descriptionEn = json['descriptionEn'];
    descriptionAr = json['descriptionAr'];
    price = (json['price'] as num?)?.toDouble();
    creationDate = json['creationDate'];
  }

  get imageUrl => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameAr'] = nameAr;
    data['descriptionEn'] = descriptionEn;
    data['descriptionAr'] = descriptionAr;
    data['price'] = price;
    data['creationDate'] = creationDate;
    return data;
  }
}