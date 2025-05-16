import 'package:bloc/bloc.dart';
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:http/http.dart' as https;


import '../../../state/home/favorites/add_remove_favorite_state.dart';

class AddRemoveFavoriteCubit extends Cubit<AddRemoveFavoriteState> {
  final String userId;

  AddRemoveFavoriteCubit({required this.userId}) : super(AddRemoveFavoriteInitial());

  Future<void> addToFavorite(String productId) async {
    emit(AddRemoveFavoriteLoading());

    try {
        final url = Uri.parse(ApiConstants.addItemToFavorite(userId, productId)

      );

      final response = await https.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AddRemoveFavoriteSuccess('Added to favorites successfully'));


      } else {
        emit(AddRemoveFavoriteError('Failed to add to favorites: ${response.statusCode}'));

      }
    } catch (e) {
      emit(AddRemoveFavoriteError('An error occurred: $e'));
    }
  }

  Future<void> removeFromFavorite(String productId) async {
    emit(AddRemoveFavoriteLoading());

    try {
      final url = Uri.parse(
        ApiConstants.deleteItemFromFavorite(userId, productId)
      );

      final response = await https.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AddRemoveFavoriteSuccess('Removed from favorites successfully'));
      } else {
        emit(AddRemoveFavoriteError('Failed to remove from favorites: ${response.statusCode}'));
      }
    } catch (e) {
      emit(AddRemoveFavoriteError('An error occurred: $e'));
    }
  }
}
