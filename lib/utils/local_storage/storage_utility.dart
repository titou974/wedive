import 'package:get_storage/get_storage.dart';

class WeDiveLocalStorage {
  static final WeDiveLocalStorage _instance = WeDiveLocalStorage._internal();

  factory WeDiveLocalStorage() {
    return _instance;
  }

  WeDiveLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<WeDive>(String key, WeDive value) async {
    await _storage.write(key, value);
  }

  WeDiveLocalStorage readData<WeDive>(String key) {
    return _storage.read(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
