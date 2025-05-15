import 'package:foodtek_project/model/top_rated_item_model.dart';
import '../services/api_service.dart';

class ItemRepository {
  Future<List<TopRatedItem>> fetchTopRatedItems() {
    return ApiService.fetchTopRatedItems();
  }

}
