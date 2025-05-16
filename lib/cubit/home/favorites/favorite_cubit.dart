import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:http/http.dart' as https;
import 'package:foodtek_project/model/get_favorite_item.dart';
import '../../../state/home/favorites/favorite_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final String userId;

  FavoritesCubit(this.userId) : super(FavoritesInitial());

  Uri get apiUrl => Uri.parse(ApiConstants.getFavoriteItemsByUserId(userId));

  Future<void> fetchFavorites() async {
    emit(FavoritesLoading());
    try {
      final response = await https.get(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final favorites = data.map((item) => GetFavoriteItem.fromJson(item)).toList();
        emit(FavoritesLoaded(favorites));
      } else {
        emit(FavoritesError('Failed to load favorites: ${response.statusCode}'));
      }
    } catch (e) {
      emit(FavoritesError('Error: ${e.toString()}'));
    }
  }

  Future<void> toggleFavorite(GetFavoriteItem item) async {
    try {
      final currentState = state;
      final itemId = item.id;

      if (itemId == null) {
        emit(FavoritesError("Item ID is null"));
        return;
      }

      if (currentState is FavoritesLoaded) {
        final isFavorite = currentState.favorites.any((fav) => fav.id == itemId);

        if (isFavorite) {
          // Remove from favorites
          final response = await https.delete(
            Uri.parse(ApiConstants.deleteItemFromFavorite(userId, itemId.toString())),
            headers: {'Content-Type': 'application/json'},
          );

          if (response.statusCode == 200) {
            final updatedFavorites = currentState.favorites.where((fav) => fav.id != itemId).toList();
            emit(FavoritesLoaded(updatedFavorites));
          } else {
            emit(FavoritesError('Failed to remove favorite: ${response.statusCode}'));
          }
        } else {
          // Add to favorites
          final response = await https.post(
            Uri.parse(ApiConstants.postFavoriteItem),
            headers: {'Content-Type': 'application/json'},
            body: json.encode({
              'userID': userId,
              'itemID': itemId.toString(),
            }),
          );

          if (response.statusCode == 200 || response.statusCode == 201) {
            final updatedFavorites = List<GetFavoriteItem>.from(currentState.favorites)..add(item);
            emit(FavoritesLoaded(updatedFavorites));
          } else {
            emit(FavoritesError('Failed to add favorite: ${response.statusCode}'));
          }
        }
      }
    } catch (e) {
      emit(FavoritesError('Error: ${e.toString()}'));
    }
  }
}
