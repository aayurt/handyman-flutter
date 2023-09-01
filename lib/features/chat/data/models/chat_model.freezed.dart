// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get contractorId => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? contractorId,
      String? customerId,
      String? msg});
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contractorId = freezed,
    Object? customerId = freezed,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatModelCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$_ChatModelCopyWith(
          _$_ChatModel value, $Res Function(_$_ChatModel) then) =
      __$$_ChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? contractorId,
      String? customerId,
      String? msg});
}

/// @nodoc
class __$$_ChatModelCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$_ChatModel>
    implements _$$_ChatModelCopyWith<$Res> {
  __$$_ChatModelCopyWithImpl(
      _$_ChatModel _value, $Res Function(_$_ChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? contractorId = freezed,
    Object? customerId = freezed,
    Object? msg = freezed,
  }) {
    return _then(_$_ChatModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      contractorId: freezed == contractorId
          ? _value.contractorId
          : contractorId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatModel implements _ChatModel {
  const _$_ChatModel(
      {@JsonKey(name: '_id') this.id,
      this.contractorId,
      this.customerId,
      this.msg});

  factory _$_ChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatModelFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? contractorId;
  @override
  final String? customerId;
  @override
  final String? msg;

  @override
  String toString() {
    return 'ChatModel(id: $id, contractorId: $contractorId, customerId: $customerId, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contractorId, contractorId) ||
                other.contractorId == contractorId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, contractorId, customerId, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      __$$_ChatModelCopyWithImpl<_$_ChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatModelToJson(
      this,
    );
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel(
      {@JsonKey(name: '_id') final String? id,
      final String? contractorId,
      final String? customerId,
      final String? msg}) = _$_ChatModel;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$_ChatModel.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String? get contractorId;
  @override
  String? get customerId;
  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$_ChatModelCopyWith<_$_ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
