import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pie_socket/page/chat_detail/chat_detail_cubit.dart';

import 'page/chat_list/chat_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatDetailCubit>(
            create: (_) => ChatDetailCubit()..getHistoryChat()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ChatListScreen(),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.grey,
          ),
          height: 48,
          width: 48,
          child: const Icon(
            Icons.send,
            color: Colors.blue,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class InputTextChat extends StatefulWidget {
  const InputTextChat({
    super.key,
  });

  @override
  State<InputTextChat> createState() => _InputTextChatState();
}

class _InputTextChatState extends State<InputTextChat> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
          height: 52,
          child: MouseRegion(
            child: TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                } else {}
              },
              controller: _controller,
              maxLines: null,
              minLines: null,
              expands: true,
              decoration: InputDecoration(
                filled: true,
                hintText: "Nhập nội dung chat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                contentPadding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 10,
                  bottom: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
