class ApiConstants {
  static const String baseUrl = 'https://team12.zero1planet.com/api';

  // Item Endpoints
  static const String getTopRatedItems = '$baseUrl/Item/GetTopRatedItem';
  static const String getTopRecommendedItems =
      '$baseUrl/Item/GetTopRecomendedItem';

  static const String getAllCategories = '$baseUrl/Category/GetAllCategory';
  static const String postFavoriteItem = '$baseUrl/Item/GetFavoriteItem';


// Offers
  static const getAllOffers = '$baseUrl/Offers/GetAllOffer';
  static const uploadBaseUrl = 'https://team12.zero1planet.com/Uploads/';

  // Favorite Endpoints
  static String addItemToFavorite(String userId, String itemId) =>
      '$baseUrl/Favorite/AddItemToFavorite?userID=$userId&itemID=$itemId';

  static String deleteItemFromFavorite(String userId, String itemId) =>
      '$baseUrl/Favorite/DeleteItemFromFavorite?userID=$userId&itemID=$itemId';

  static String getFavoriteItemsByUserId(String userId) =>
      '$baseUrl/Item/GetFavoriteItemByUserID?userID=$userId';

  static String getFavoriteItemDeleteUri(String userId, String itemId) =>
      '$baseUrl/Item/GetFavoriteItemByUserID?userID=$userId&itemID=$itemId';

static String getNotificationsByUserId(String userId) =>
      '$baseUrl/Notification/GetAllNotificationByUserID?userID=$userId';


}
