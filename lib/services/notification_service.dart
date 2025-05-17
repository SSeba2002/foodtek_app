import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:foodtek_project/constant/api_constants.dart';
import '../model/notification_model.dart';

class NotificationApiService {
  Future<List<NotificationModel>> fetchNotifications(String userId) async {
    final url = ApiConstants.getNotificationsByUserId(userId);
    print('📡 Fetching from: $url');

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'User-Agent': 'Mozilla/5.0', // يساعد أحيانًا
      },
    );

    print('Status: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => NotificationModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load notifications (HTTP ${response.statusCode})');
    }
  }
}
