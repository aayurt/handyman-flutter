part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = ChatStateInitial;
  const factory ChatState.loading() = ChatStateLoading;
  const factory ChatState.loaded({required List<ChatModel> chats}) =
      ChatStateLoaded;
  const factory ChatState.error() = ChatStateError;
}
