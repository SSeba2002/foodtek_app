

abstract class AddRemoveFavoriteState {}

class AddRemoveFavoriteInitial extends AddRemoveFavoriteState {}

class AddRemoveFavoriteLoading extends AddRemoveFavoriteState {}

class AddRemoveFavoriteSuccess extends AddRemoveFavoriteState {
  final String message;

  AddRemoveFavoriteSuccess(this.message);
}

class AddRemoveFavoriteError extends AddRemoveFavoriteState {
  final String errorMessage;

  AddRemoveFavoriteError(this.errorMessage);
}