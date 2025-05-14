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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameEn'] = this.nameEn;
    data['nameAr'] = this.nameAr;
    data['image'] = this.image;
    return data;
  }
}