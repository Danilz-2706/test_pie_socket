import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/message.dart';

part 'chat_detail_state.dart';

class ChatDetailCubit extends Cubit<ChatDetailState> {
  ChatDetailCubit() : super(ChatDetailInitial());

  List<Message> list = [
    Message(
        message: "123123123123123123123123123123123123123123123123",
        time: "13:25",
        sender: true),
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
      list.add(message);
      emit(GetHistoryChat(listMessage: list));
    } catch (e) {
      emit(ErrorHistoryChat());
    }
  }
}
