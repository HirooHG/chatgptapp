import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/homeview.dart';
import 'modelview/chatgptbloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatGptBloc>(
          create: (_) => ChatGptBloc()
        )
      ],
      child: HomeView(),
    );
  }
}
