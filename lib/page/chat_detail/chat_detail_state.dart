part of 'chat_detail_cubit.dart';

@immutable
sealed class ChatDetailState {}

final class ChatDetailInitial extends ChatDetailState {}

final class GetHistoryChat extends ChatDetailState {
  final List<Message> listMessage;

  GetHistoryChat({required this.listMessage});
}

final class LoadingHistoryChat extends ChatDetailState {}

final class ErrorHistoryChat extends ChatDetailState {}
