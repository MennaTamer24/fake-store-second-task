import 'package:hive/hive.dart';

abstract class FavoriteDataSource {
  Future<void> toggleFavorite(int productId);
  List<int> getFavoriteProductIds();
  bool isFavorite(int productId);
}

class FavoriteDataSourceImpl implements FavoriteDataSource {
  final Box box;

  FavoriteDataSourceImpl(this.box);

  @override
  List<int> getFavoriteProductIds() {
    final favorites = box.get('favorites', defaultValue: <int>[]);
    return List<int>.from(favorites);
  }

  @override
  bool isFavorite(int productId) {
    final favorites = List<int>.from(
      box.get('favorites', defaultValue: <int>[]),
    );

    return favorites.contains(productId);
  }

  @override
  Future<void> toggleFavorite(int productId) async {
    final favorites = List<int>.from(
      box.get('favorites', defaultValue: <int>[]),
    );

    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }

    await box.put('favorites', favorites);
  }
}
