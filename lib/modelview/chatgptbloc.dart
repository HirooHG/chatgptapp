
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ChatEvent {

}

abstract class ChatState {

}

class InitChatState extends ChatState {

}

class ChatGptBloc extends Bloc<ChatEvent, ChatState> {
  ChatGptBloc() : super(InitChatState()) {
    on<ChatEvent>(onChatEvent);
  }

  onChatEvent(event, emit) {

  }
}
