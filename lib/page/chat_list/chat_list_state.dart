part of 'chat_list_cubit.dart';

@immutable
sealed class ChatListState {}

final class ChatListInitial extends ChatListState {}

final class GetHistoryChat extends ChatListState {
  final List<Message> list_message;

  GetHistoryChat(this.list_message);
}

final class LoadingHistoryChat extends ChatListState {}

final class ErrorHistoryChat extends ChatListState {}
