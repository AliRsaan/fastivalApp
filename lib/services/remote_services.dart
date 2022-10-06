import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/category_details_model.dart';
import '../model/category_model.dart';

class RemoteServices {
  //"https://localhost:44341/api/Category"
  //https://localhost:44341/api/Category?id=1
  String baseUrl = "https://localhost:44341/api";
  Future<List<CategoryModel>?> getCategory(String apiLast) async {
    var response = await http.get(Uri.parse("$baseUrl/$apiLast"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => CategoryModel.fromJson(e)).toList();
    }
    return null;
  }

  Future<List<CategoryDetailsModel>?> getCategoryDetails(int cate_id) async {
    var response = await http.get(Uri.parse("$baseUrl/Category?id=${cate_id}"));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      return jsonData.map((e) => CategoryDetailsModel.fromJson(e)).toList();
    }
    return null;
  }
}
