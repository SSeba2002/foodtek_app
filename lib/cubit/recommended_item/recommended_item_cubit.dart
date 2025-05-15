import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/cubit/recommended_item/recommended_item_state.dart';
import 'package:foodtek_project/data/recommended_item_repository.dart';
import 'package:foodtek_project/model/recommended_item_model.dart';



class RecommendedItemCubit extends Cubit<RecommendedItemState> {
  final RecommendedItemRepository repository;

  RecommendedItemCubit(this.repository) : super(RecommendedItemInitial());

  Future<void> loadRecommendedItems() async {
    emit(RecommendedItemLoading());
    try {
      final items = await repository.getRecommendedItems();
      emit(RecommendedItemLoaded(items.cast<RecommendedItem>()));
    } catch (e) {
      emit(RecommendedItemError('Recommended items failed to load'));
    }
  }
}
