
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';

import 'token.dart';

abstract class ChatEvent {
  const ChatEvent();
}

class InitChatEvent extends ChatEvent {
  const InitChatEvent();
}

class ChangeTokenEvent extends ChatEvent {
  const ChangeTokenEvent({required this.token});

  final Token token;
}

abstract class ChatState {
  Token token;
  ChatGPTApi? api;

  ChatState({
    required this.token,
    this.api
  });
}

class InitChatState extends ChatState {
  InitChatState({
    required super.token,
    super.api
  });

  Future init() async {
    var box = await Hive.openBox('token');

    String? tok = await box.get("token");
    String? clearance = await box.get("clearance");

    token = Token(session: tok, clearance: clearance);
    if(token.session != null && token.clearance != null) {
      api = ChatGPTApi(sessionToken: token.session!, clearanceToken: token.clearance!);
    }
  }
}

class ChangedTokenState extends ChatState {
  ChangedTokenState({
    required super.token,
    super.api
  });
}

class ChatGptBloc extends Bloc<ChatEvent, ChatState> {
  ChatGptBloc() : super(InitChatState(
        token: Token.empty(),
      )
    ) {
    on<ChatEvent>(onChatEvent);
  }

  onChatEvent(event, emit) async {
    switch(event.runtimeType) {
      case InitChatEvent:
        InitChatState nextState = InitChatState(
          token: state.token,
          api: state.api
        );
        await nextState.init();
        emit(nextState);
        break;
      case ChangeTokenEvent:
        ChangedTokenState nextState = ChangedTokenState(
          token: (event as ChangeTokenEvent).token,
          api: state.api
        );
        emit(nextState);
        break;
    }
  }
}
