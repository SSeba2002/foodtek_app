import 'dart:convert';
import 'package:foodtek_project/model/top_rated_item_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<RecommendedItem>> fetchTopRatedItems() async {
    final response = await http.get(Uri.parse('https://team12.zero1planet.com/api/Item/GetTopRatedItem'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((item) => RecommendedItem.fromJson(item)).toList();
    } else {
      throw Exception('Top rated items failed to load');
    }
  }
}
