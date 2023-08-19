import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pie_socket/repo/web_socket.dart';

import '../../model/message.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  WebsocketRepo websocketRepo;
  ChatDetailCubit({required this.websocketRepo}) : super(ChatDetailInitial());

  List<Message> list = [
    Message(
        message: "123123123123123123123123123123123123123123123123",
        time: "13:25",
        sender: true),
    Message(message: "1231231", time: "13:25", sender: false),
    Message(message: "1231231", time: "13:25", sender: false),
    Message(message: "1231231", time: "13:25", sender: false),
  ];
  void getHistoryChat() {
    try {
      emit(LoadingHistoryChat());
      emit(GetHistoryChat(listMessage: list));
    } catch (e) {
      emit(ErrorHistoryChat());
    }
  }

  void addChat(Message message) {
    try {
      emit(LoadingHistoryChat());
      list.insert(0, message);
       websocketRepo.addMessage(message);
      emit(GetHistoryChat(listMessage: list));
    } catch (e) {
      emit(ErrorHistoryChat());
    }
  }
}
