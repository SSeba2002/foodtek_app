import 'package:foodtek_project/model/top_rated_item_model.dart';
import '../services/api_service.dart';

class ItemRepository {
  Future<List<RecommendedItem>> fetchTopRatedItems() {
    return ApiService.fetchTopRatedItems();
  }

}
