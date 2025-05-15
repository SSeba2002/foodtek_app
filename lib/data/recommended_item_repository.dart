import 'package:foodtek_project/services/recommended_item_service.dart';

import '../model/recommended_item_model.dart';

class RecommendedItemRepository {
  final RecommendedItemService service;

  RecommendedItemRepository(this.service);

  Future<List<RecommendedItem>> getRecommendedItems() {
    return service.fetchRecommendedItems();
  }
}
