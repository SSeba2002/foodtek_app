import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/data/item_repository.dart';
import 'package:foodtek_project/cubit/top_rated/top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final ItemRepository itemRepository;

  TopRatedCubit(this.itemRepository) : super(TopRatedInitial()) {
    fetchTopRatedItems();
  }

  void fetchTopRatedItems() async {
    try {
      emit(TopRatedLoading());
      final items = await itemRepository.fetchTopRatedItems();
      emit(TopRatedLoaded(items));
    } catch (e) {
      emit(TopRatedError(e.toString()));
    }
  }
}
