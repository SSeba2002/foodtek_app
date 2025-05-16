import 'dart:convert';
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:foodtek_project/model/top_rated_item_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<TopRatedItem>> fetchTopRatedItems() async {
    final response = await http.get(Uri.parse(ApiConstants.getTopRatedItems));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => TopRatedItem.fromJson(item)).toList();
    } else {
      throw Exception('Top rated items failed to load');
    }
  }
}



