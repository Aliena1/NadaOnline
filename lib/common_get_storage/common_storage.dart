import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();

  factory StorageService() {
    return _instance;
  }

  StorageService._internal();

  final GetStorage _box = GetStorage();

  // Method to retrieve a stored value
  dynamic getValue(String key) {
    return _box.read(key);
  }

  // Method to store a value
  void setValue(String key, dynamic value) {
    _box.write(key, value);
  }

  // Method to check if a key exists
  bool containsKey(String key) {
    return _box.hasData(key);
  }

  // Method to remove a stored value
  void removeValue(String key) {
    _box.remove(key);
  }
}
