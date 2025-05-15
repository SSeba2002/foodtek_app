

import 'package:foodtek_project/model/recommended_item_model.dart';

abstract class RecommendedItemState {}

class RecommendedItemInitial extends RecommendedItemState {}

class RecommendedItemLoading extends RecommendedItemState {}

class RecommendedItemLoaded extends RecommendedItemState {
  final List<RecommendedItem > items;
  RecommendedItemLoaded(this.items);
}

class RecommendedItemError extends RecommendedItemState {
  final String message;
  RecommendedItemError(this.message);
}
