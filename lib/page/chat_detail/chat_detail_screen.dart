import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_pie_socket/model/message.dart';
import 'package:test_pie_socket/page/contains.dart';

import '../../widget/receiver_card.dart';
import '../../widget/sender_card.dart';
import '../chat_list/chat_list_screen.dart';
import 'chat_detail_cubit.dart';

class ChatDetailScreen extends StatefulWidget {
  final String avatar;
  final String name;
  const ChatDetailScreen({
    Key? key,
    required this.avatar,
    required this.name,
  }) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
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
    // WidgetsBinding.instance.addPostFrameCallback((_) => scrollListToEnd());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColors,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigateChat(
              title: widget.name,
              avatar: "assets/Group.svg",
              press: () {
                Navigator.pop(context);
              },
              isList: false,
            ),
            Expanded(
              child: BlocConsumer<ChatDetailCubit, ChatDetailState>(
                listener: (context, state) {
                  if (state is GetHistoryChat) {
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => scrollListToEnd());
                  }
                },
                builder: (context, state) {
                  if (state is GetHistoryChat) {
                    if (state.listMessage.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.all(24),
                        child: Center(
                          child: Text(
                            "Gui tin nhan den chuyen gia cua chung toi de nhan tu van nhe!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kTextGreyDarkColors,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: ListView.builder(
                        itemCount: state.listMessage.length,
                        controller: scrollController,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index > 0 &&
                              state.listMessage[index].sender! &&
                              state.listMessage[index - 1].sender!) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: SenderCard(
                                message: state.listMessage[index].message!,
                                date: state.listMessage[index].time!,
                              ),
                            );
                          }
                          if (state.listMessage[index].sender!) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: SenderCard(
                                message: state.listMessage[index].message!,
                                date: state.listMessage[index].time!,
                              ),
                            );
                          }
                          if (index > 0 &&
                              !state.listMessage[index].sender! &&
                              !state.listMessage[index - 1].sender!) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: ReceiverCard(
                                message: state.listMessage[index].message!,
                                date: state.listMessage[index].time!,
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: ReceiverCard(
                              message: state.listMessage[index].message!,
                              date: state.listMessage[index].time!,
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            const InputChat(),
          ],
        ),
      ),
    );
  }
}

class InputChat extends StatefulWidget {
  const InputChat({
    super.key,
  });

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            "assets/gallery.svg",
            height: 24,
          ),
          SvgPicture.asset(
            "assets/link.svg",
            height: 24,
          ),
          Container(
            width: 204,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color.fromRGBO(246, 246, 246, 1),
            ),
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
                  top: 0,
                  bottom: 0,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<ChatDetailCubit>().addChat(
                    Message(
                        message: _controller.text,
                        time: DateTime.now().toString(),
                        sender: true),
                  );
              _controller.clear();
            },
            child: SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                "assets/Vector.svg",
                height: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
