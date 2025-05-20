import 'dart:convert';
import 'package:foodtek_project/model/offer_model.dart';
import 'package:http/http.dart' as http;
import '../constant/api_constants.dart';

class OfferService {
  Future<List<OfferModel>> fetchOffers() async {
    final response = await http.get(Uri.parse(ApiConstants.getAllOffers));
    try {
      final response = await http.get(Uri.parse(ApiConstants.getAllOffers));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => OfferModel.fromJson(e)).toList();
      } else {
        throw Exception('HTTP Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching offers: $e'); 
      rethrow;
    }
  }
}

