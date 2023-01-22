
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modelview/chatgptbloc.dart';


class ChatView extends StatelessWidget {
  ChatView({super.key});

  late double width;
  late double height;
  
  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      children: [
       
      ]
    );
  }
}
