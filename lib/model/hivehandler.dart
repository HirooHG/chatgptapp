
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveHandler {

  static Future<String?> getToken() async {
    var box = await Hive.openBox<String>('token');
    var token = box.get("token");

    return token;
  }
  static Future<String?> getCLearance() async {
    var box = await Hive.openBox<String>('token');
    var clearance = box.get("clearance");
    await box.close();

    return clearance;
  }
}
