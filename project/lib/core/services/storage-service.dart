import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoggedIn = false;

  void storeItem({String? key, String? value}) async {
    await storage.write(key: key!, value: value);
  }

  Future<dynamic> readItem({String? key}) async {
    final value = await storage.read(key: key!);
    return value;
  }

  void deleteItem({String? key}) async {
    await storage.delete(key: key!);
  }

  void deleteAllItems() async {
    await storage.deleteAll();
  }

  Future<dynamic> hasKey({String? key}) async {
    return await storage.containsKey(key: key!);
  }
}
