
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  late double width;
  late double height;

  bool isToken = false;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    Hive.openBox<String>('token').then((box) async {
      var token = box.get("token");
      var clearance = box.get("clearance");

      if(token == null) {
        isToken = true;
      } else {

      }
      await box.close();
    });

    return Scaffold(
      body: Container(
      )
    );
  }
}
