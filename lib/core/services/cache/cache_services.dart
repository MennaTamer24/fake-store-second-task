import 'package:hive_flutter/hive_flutter.dart';

class CacheServices {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  final Map<String, Box> _boxes = {};

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  Future<Box> getBox(String boxName) async {
    if (_boxes[boxName] == null) {
      _boxes[boxName] = await openBox(boxName);
    }
    return _boxes[boxName]!;
  }

  Future<T> get<T>({
    required String boxName,
    required key,
    defaultValue,
  }) async {
    final box = await getBox(boxName);

    return box.get(key, defaultValue: defaultValue) as T;
  }

  Future<void> put<T>({
    required String boxName,
    required key,
    required T value,
  }) async {
    final box = await getBox(boxName);

    await box.put(key, value);
  }

  Future<void> clear({required String boxName}) async {
    final box = await getBox(boxName);

    await box.clear();
  }
}
