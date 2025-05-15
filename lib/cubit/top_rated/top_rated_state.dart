import 'package:foodtek_project/model/top_rated_item_model.dart';


abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final List<TopRatedItem> items;
  TopRatedLoaded(this.items);
}

class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError(this.message);
}
