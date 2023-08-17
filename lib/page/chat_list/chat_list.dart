import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pie_socket/page/chat_list/chat_list_cubit.dart';
import 'package:test_pie_socket/widget/receiver_card.dart';
import 'package:test_pie_socket/widget/sender_card.dart';

class ChatList extends StatefulWidget {
  const ChatList({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController scrollController = ScrollController();

  void scrollListToEnd() async {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollListToEnd());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatListCubit, ChatListState>(
      listener: (context, state) {
        if (state is GetHistoryChat) {
          WidgetsBinding.instance
              .addPostFrameCallback((_) => scrollListToEnd());
        }
      },
      builder: (context, state) {
        if (state is GetHistoryChat) {
          return ListView.builder(
            itemCount: state.list_message.length,
            controller: scrollController,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (state.list_message[index].sender == 1) {
                return SenderCard(
                  message: state.list_message[index].message!,
                );
              }
              return ReceiverCard(
                message: state.list_message[index].message!,
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
