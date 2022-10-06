// To parse this JSON data, do
//
//     final categoryDetailsModel = categoryDetailsModelFromJson(jsonString);

import 'dart:convert';

List<CategoryDetailsModel> categoryDetailsModelFromJson(String str) =>
    List<CategoryDetailsModel>.from(
        json.decode(str).map((x) => CategoryDetailsModel.fromJson(x)));

String categoryDetailsModelToJson(List<CategoryDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryDetailsModel {
  CategoryDetailsModel({
    required this.cateDeId,
    required this.cateId,
    required this.cateDeImUrl,
    required this.cateDeImageName,
  });

  int cateDeId;
  int cateId;
  String cateDeImUrl;
  String cateDeImageName;

  factory CategoryDetailsModel.fromJson(Map<String, dynamic> json) =>
      CategoryDetailsModel(
        cateDeId: json["cateDe_id"],
        cateId: json["cate_id"],
        cateDeImUrl: json["cateDe_im_url"],
        cateDeImageName: json["cateDe_image_name"],
      );

  Map<String, dynamic> toJson() => {
        "cateDe_id": cateDeId,
        "cate_id": cateId,
        "cateDe_im_url": cateDeImUrl,
        "cateDe_image_name": cateDeImageName,
      };
}
