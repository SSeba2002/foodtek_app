class GetAllCategory {
  int? id;
  String? nameEn;
  String? nameAr;
  String? image;

  GetAllCategory({this.id, this.nameEn, this.nameAr, this.image});

  GetAllCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['nameEn'];
    nameAr = json['nameAr'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nameEn'] = nameEn;
    data['nameAr'] = nameAr;
    data['image'] = image;
    return data;
  }
}