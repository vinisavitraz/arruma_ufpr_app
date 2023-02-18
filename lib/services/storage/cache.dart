import 'package:get_storage/get_storage.dart';
import 'package:mib_app/services/storage/cache_object.dart';

class Cache {

  static Future<bool> initStorage() async {
    await GetStorage.init();
    return true;
  }

  static Future<bool> save(
      String key,
      Object value
      ) async {
    final dataStorage = GetStorage();

    await dataStorage.write(key, value);

    return true;
  }

  static Future<bool> saveObject(
      String key,
      CacheObject object
      ) async {
    final dataStorage = GetStorage();

    await dataStorage.write(key, object.toJson());

    return true;
  }

  static Future<bool> delete(String key) async {
    final dataStorage = GetStorage();

    await dataStorage.remove(key);

    return true;
  }

  static dynamic get(String key) {
    final dataStorage = GetStorage();

    return dataStorage.read(key);
  }

}