import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:foodtek_project/model/offer_model.dart';

class OfferRepository {
  Future<List<OfferModel>> fetchOffers() async {
  final url = Uri.parse(ApiConstants.getAllOffers);

  try {
    print('FETCHING FROM: $url'); 
    final response = await http.get(url);
    print('STATUS: ${response.statusCode}');
    print('BODY: ${response.body}');

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => OfferModel.fromJson(e)).toList();
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error fetching offers: $e');
  }
}

}

