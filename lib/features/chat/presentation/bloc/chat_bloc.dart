import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/core/constants/constants.dart';
import 'package:handyman/core/network/api_list.dart';
import 'package:handyman/core/network/api_service.dart';
import 'package:handyman/features/chat/data/models/chat_model.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(const ChatStateInitial()) {
    on<ChatEventGet>((event, emit) async {
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const ChatState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, ApiList.chat, {}),
        );
        if (response.statusCode == 200) {
          final List applicationResponseData = response.data["data"];

          if (applicationResponseData.isNotEmpty) {
            final List<ChatModel> chats = applicationResponseData.map(
              (e) {
                return ChatModel.fromJson(e);
              },
            ).toList();

            emit(ChatState.loaded(chats: chats));
          } else {
            emit(const ChatState.loaded(chats: []));
          }
        } else {
          emit(const ChatState.error());
        }
      }
    });
  }
}
