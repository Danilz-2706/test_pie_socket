import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pie_socket/page/chat_detail/chat_detail_cubit.dart';

import 'page/chat_list/chat_list_screen.dart';
import 'repo/web_socket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WebsocketRepo>(
          create: (_) => WebsocketRepo()..connectWebsocket(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ChatDetailCubit>(
              create: (_) => ChatDetailCubit(
                  websocketRepo: RepositoryProvider.of<WebsocketRepo>(_))
                ..getHistoryChat()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ChatListScreen(),
        ),
      ),
    );
  }
}
