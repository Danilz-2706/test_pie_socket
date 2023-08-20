import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_pie_socket/page/chat_detail/chat_detail_screen.dart';

import '../../widget/app_bar_review.dart';

var list = [
  {
    "avatar": "assets/Group.svg",
    "name": "Gara Tuan Hung",
    "last_message": "Like your...",
    "time": "13:25",
    "read": true,
  },
  {
    "avatar": "assets/Group.svg",
    "name": "Gara Tuan Hung",
    "last_message": "Like your...",
    "time": "13:25",
    "read": true,
  },
  {
    "avatar": "assets/Group.svg",
    "name": "Gara Tuan Hung",
    "last_message": "Like your...",
    "time": "13:25",
    "read": false,
  },
  {
    "avatar": "assets/Group.svg",
    "name": "Gara Tuan Hung",
    "last_message": "Like your...",
    "time": "13:25",
    "read": false,
  }
];

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: AppBarReview(
                title: 'Danh sach lien he',
                avatar: 'assets/Group.svg',
                press: () {},
              ),
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.only(left: 28, right: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 48,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
              ),
              child: const SearchChatList(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28, right: 20),
              child: Expanded(
                child: Column(
                  children: List.generate(
                    list.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatDetailScreen(
                                avatar: list[index]['avatar'].toString(),
                                name: list[index]['name'].toString(),
                              ),
                            ),
                          );
                        },
                        child: ChatItem(
                          avatar: 'assets/Oval.png',
                          name: list[index]['name'].toString(),
                          lastMessage: list[index]['last_message'].toString(),
                          time: list[index]['time'].toString(),
                          read: bool.tryParse(list[index]['read'].toString())!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class SearchChatList extends StatelessWidget {
  const SearchChatList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: TextField(),
        ),
        SvgPicture.asset(
          "assets/search-normal.svg",
          height: 24,
          width: 24,
        ),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String lastMessage;
  final String time;
  final bool? read;
  const ChatItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.read,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(246, 246, 246, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            avatar,
            height: 60,
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Color.fromRGBO(10, 11, 9, 1),
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        if (read!)
                          SvgPicture.asset(
                            "assets/Shape.svg",
                            height: 10,
                            width: 10,
                          ),
                        const SizedBox(width: 6),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Color.fromRGBO(139, 141, 140, 1),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color.fromRGBO(139, 141, 140, 1),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
