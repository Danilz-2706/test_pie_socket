import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../model/message.dart';

part 'chat_list_state.dart';

class ChatListCubit extends Cubit<ChatListState> {
  ChatListCubit() : super(ChatListInitial());
  void getHistoryChat() {
    emit(LoadingHistoryChat());
    emit(GetHistoryChat([]));
  }
}
