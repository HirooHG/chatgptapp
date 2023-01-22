
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modelview/chatgptbloc.dart';
import '../modelview/token.dart';

import 'chatview.dart';
import 'addtokenview.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  late double width;
  late double height;

  bool isToken = false;

  final TextEditingController sessionController = TextEditingController();
  final TextEditingController clearanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    if(!isToken) {
      BlocProvider.of<ChatGptBloc>(context).add(const InitChatEvent());
      isToken = true;
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF1a1a1a),
          child: BlocBuilder<ChatGptBloc, ChatState>(
            builder: (context, chatState) {
              if(chatState.token == Token.empty()) {
                return const Center(
                  child: CircularProgressIndicator()
                );
              } else if (chatState.token.session == null) {
                return AddTokenView(
                  sessionController: sessionController,
                  clearanceController: clearanceController
                );
              } else {
                return ChatView();
              }
            }
          )
        )
      )
    );
  }
}
