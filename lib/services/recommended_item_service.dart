import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/recommended_item_model.dart';

class RecommendedItemService {
  Future<List<RecommendedItem>> fetchRecommendedItems() async {
    final response = await http.get(
      Uri.parse('https://team12.zero1planet.com/api/Item/GetTopRecomendedItem'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((e) => RecommendedItem.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load recommended items');
    }
  }
}
