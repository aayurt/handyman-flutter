import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/login/data/models/login_api_response_model.dart';
part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @JsonKey(name: '_id') String? id,
    User? contractor,
    User? customer,
    String? msg,
    String? senderId,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
}
