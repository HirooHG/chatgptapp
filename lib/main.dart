import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chatgptapp.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const ChatGptApp());
}

