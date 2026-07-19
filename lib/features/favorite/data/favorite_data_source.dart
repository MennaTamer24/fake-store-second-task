// import 'package:fake_store_second_task/core/services/cache/cache_services.dart';

// abstract class FavoriteDataSource {
//   Future<void> toggleFavorite(int productId);
//   List<int> getFavoriteProductIds();
//   bool isFavorite(int productId);
// }

// class FavoriteDataSourceImpl implements FavoriteDataSource {
//   final CacheServices storage;

//   FavoriteDataSourceImpl(this.storage);

//   @override
//   List<int> getFavoriteProductIds() {
//     final box = storage.getBox('favorites');

//     final favorites = box.get('favorites', defaultValue: <int>[]);

//     return List<int>.from(favorites);
//   }

//   @override
//   bool isFavorite(int productId) {
//     final box = storage.getBox('favorites');

//     final favorites = List<int>.from(
//       box.get('favorites', defaultValue: <int>[]),
//     );

//     return favorites.contains(productId);
//   }

//   @override
//   Future<void> toggleFavorite(int productId) async {
//     final box = storage.getBox('favorites');

//     final favorites = List<int>.from(
//       box.get('favorites', defaultValue: <int>[]),
//     );

//     if (favorites.contains(productId)) {
//       favorites.remove(productId);
//     } else {
//       favorites.add(productId);
//     }

//     await box.put('favorites', favorites);
//   }
// }
