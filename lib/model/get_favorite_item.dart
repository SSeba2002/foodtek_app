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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['descriptionEn'] = this.descriptionEn;
    data['descriptionAr'] = this.descriptionAr;
    data['price'] = this.price;
    data['creationDate'] = this.creationDate;
    return data;
  }
}