// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginApiResponseModel _$LoginApiResponseModelFromJson(
    Map<String, dynamic> json) {
  return _LoginApiResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LoginApiResponseModel {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginApiResponseModelCopyWith<LoginApiResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginApiResponseModelCopyWith<$Res> {
  factory $LoginApiResponseModelCopyWith(LoginApiResponseModel value,
          $Res Function(LoginApiResponseModel) then) =
      _$LoginApiResponseModelCopyWithImpl<$Res, LoginApiResponseModel>;
  @useResult
  $Res call(
      {bool? status,
      String? message,
      String? accessToken,
      String? userType,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginApiResponseModelCopyWithImpl<$Res,
        $Val extends LoginApiResponseModel>
    implements $LoginApiResponseModelCopyWith<$Res> {
  _$LoginApiResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? accessToken = freezed,
    Object? userType = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_LoginApiResponseModelCopyWith<$Res>
    implements $LoginApiResponseModelCopyWith<$Res> {
  factory _$$_LoginApiResponseModelCopyWith(_$_LoginApiResponseModel value,
          $Res Function(_$_LoginApiResponseModel) then) =
      __$$_LoginApiResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status,
      String? message,
      String? accessToken,
      String? userType,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_LoginApiResponseModelCopyWithImpl<$Res>
    extends _$LoginApiResponseModelCopyWithImpl<$Res, _$_LoginApiResponseModel>
    implements _$$_LoginApiResponseModelCopyWith<$Res> {
  __$$_LoginApiResponseModelCopyWithImpl(_$_LoginApiResponseModel _value,
      $Res Function(_$_LoginApiResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? accessToken = freezed,
    Object? userType = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_LoginApiResponseModel(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginApiResponseModel implements _LoginApiResponseModel {
  const _$_LoginApiResponseModel(
      {this.status, this.message, this.accessToken, this.userType, this.user});

  factory _$_LoginApiResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_LoginApiResponseModelFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final String? accessToken;
  @override
  final String? userType;
  @override
  final User? user;

  @override
  String toString() {
    return 'LoginApiResponseModel(status: $status, message: $message, accessToken: $accessToken, userType: $userType, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginApiResponseModel &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, accessToken, userType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginApiResponseModelCopyWith<_$_LoginApiResponseModel> get copyWith =>
      __$$_LoginApiResponseModelCopyWithImpl<_$_LoginApiResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginApiResponseModelToJson(
      this,
    );
  }
}

abstract class _LoginApiResponseModel implements LoginApiResponseModel {
  const factory _LoginApiResponseModel(
      {final bool? status,
      final String? message,
      final String? accessToken,
      final String? userType,
      final User? user}) = _$_LoginApiResponseModel;

  factory _LoginApiResponseModel.fromJson(Map<String, dynamic> json) =
      _$_LoginApiResponseModel.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  String? get accessToken;
  @override
  String? get userType;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$_LoginApiResponseModelCopyWith<_$_LoginApiResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'location')
  Location? get location => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'bio')
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'linkedIn')
  String? get linkedIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'github')
  String? get github => throw _privateConstructorUsedError;
  @JsonKey(name: 'website')
  String? get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'skills')
  List<String>? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: 'interests')
  List<String>? get interests => throw _privateConstructorUsedError;
  @JsonKey(name: 'experiences')
  List<Experience>? get experiences => throw _privateConstructorUsedError;
  @JsonKey(name: 'education')
  List<Education>? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'numRatings')
  int? get numRatings => throw _privateConstructorUsedError;
  @JsonKey(name: 'ratingSum')
  int? get ratingSum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'location') Location? location,
      @JsonKey(name: '_id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'linkedIn') String? linkedIn,
      @JsonKey(name: 'github') String? github,
      @JsonKey(name: 'website') String? website,
      @JsonKey(name: 'skills') List<String>? skills,
      @JsonKey(name: 'interests') List<String>? interests,
      @JsonKey(name: 'experiences') List<Experience>? experiences,
      @JsonKey(name: 'education') List<Education>? education,
      @JsonKey(name: 'numRatings') int? numRatings,
      @JsonKey(name: 'ratingSum') int? ratingSum});

  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? bio = freezed,
    Object? avatar = freezed,
    Object? address = freezed,
    Object? linkedIn = freezed,
    Object? github = freezed,
    Object? website = freezed,
    Object? skills = freezed,
    Object? interests = freezed,
    Object? experiences = freezed,
    Object? education = freezed,
    Object? numRatings = freezed,
    Object? ratingSum = freezed,
  }) {
    return _then(_value.copyWith(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: freezed == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      experiences: freezed == experiences
          ? _value.experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      numRatings: freezed == numRatings
          ? _value.numRatings
          : numRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingSum: freezed == ratingSum
          ? _value.ratingSum
          : ratingSum // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'location') Location? location,
      @JsonKey(name: '_id') String? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'bio') String? bio,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'linkedIn') String? linkedIn,
      @JsonKey(name: 'github') String? github,
      @JsonKey(name: 'website') String? website,
      @JsonKey(name: 'skills') List<String>? skills,
      @JsonKey(name: 'interests') List<String>? interests,
      @JsonKey(name: 'experiences') List<Experience>? experiences,
      @JsonKey(name: 'education') List<Education>? education,
      @JsonKey(name: 'numRatings') int? numRatings,
      @JsonKey(name: 'ratingSum') int? ratingSum});

  @override
  $LocationCopyWith<$Res>? get location;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? gender = freezed,
    Object? bio = freezed,
    Object? avatar = freezed,
    Object? address = freezed,
    Object? linkedIn = freezed,
    Object? github = freezed,
    Object? website = freezed,
    Object? skills = freezed,
    Object? interests = freezed,
    Object? experiences = freezed,
    Object? education = freezed,
    Object? numRatings = freezed,
    Object? ratingSum = freezed,
  }) {
    return _then(_$_User(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedIn: freezed == linkedIn
          ? _value.linkedIn
          : linkedIn // ignore: cast_nullable_to_non_nullable
              as String?,
      github: freezed == github
          ? _value.github
          : github // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      experiences: freezed == experiences
          ? _value._experiences
          : experiences // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      education: freezed == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      numRatings: freezed == numRatings
          ? _value.numRatings
          : numRatings // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingSum: freezed == ratingSum
          ? _value.ratingSum
          : ratingSum // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {@JsonKey(name: 'location') this.location,
      @JsonKey(name: '_id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'phone') this.phone,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'bio') this.bio,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'linkedIn') this.linkedIn,
      @JsonKey(name: 'github') this.github,
      @JsonKey(name: 'website') this.website,
      @JsonKey(name: 'skills') final List<String>? skills,
      @JsonKey(name: 'interests') final List<String>? interests,
      @JsonKey(name: 'experiences') final List<Experience>? experiences,
      @JsonKey(name: 'education') final List<Education>? education,
      @JsonKey(name: 'numRatings') this.numRatings,
      @JsonKey(name: 'ratingSum') this.ratingSum})
      : _skills = skills,
        _interests = interests,
        _experiences = experiences,
        _education = education;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'location')
  final Location? location;
  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'bio')
  final String? bio;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'linkedIn')
  final String? linkedIn;
  @override
  @JsonKey(name: 'github')
  final String? github;
  @override
  @JsonKey(name: 'website')
  final String? website;
  final List<String>? _skills;
  @override
  @JsonKey(name: 'skills')
  List<String>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _interests;
  @override
  @JsonKey(name: 'interests')
  List<String>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Experience>? _experiences;
  @override
  @JsonKey(name: 'experiences')
  List<Experience>? get experiences {
    final value = _experiences;
    if (value == null) return null;
    if (_experiences is EqualUnmodifiableListView) return _experiences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Education>? _education;
  @override
  @JsonKey(name: 'education')
  List<Education>? get education {
    final value = _education;
    if (value == null) return null;
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'numRatings')
  final int? numRatings;
  @override
  @JsonKey(name: 'ratingSum')
  final int? ratingSum;

  @override
  String toString() {
    return 'User(location: $location, id: $id, name: $name, email: $email, phone: $phone, gender: $gender, bio: $bio, avatar: $avatar, address: $address, linkedIn: $linkedIn, github: $github, website: $website, skills: $skills, interests: $interests, experiences: $experiences, education: $education, numRatings: $numRatings, ratingSum: $ratingSum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.linkedIn, linkedIn) ||
                other.linkedIn == linkedIn) &&
            (identical(other.github, github) || other.github == github) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            const DeepCollectionEquality()
                .equals(other._experiences, _experiences) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            (identical(other.numRatings, numRatings) ||
                other.numRatings == numRatings) &&
            (identical(other.ratingSum, ratingSum) ||
                other.ratingSum == ratingSum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      location,
      id,
      name,
      email,
      phone,
      gender,
      bio,
      avatar,
      address,
      linkedIn,
      github,
      website,
      const DeepCollectionEquality().hash(_skills),
      const DeepCollectionEquality().hash(_interests),
      const DeepCollectionEquality().hash(_experiences),
      const DeepCollectionEquality().hash(_education),
      numRatings,
      ratingSum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'location') final Location? location,
      @JsonKey(name: '_id') final String? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'bio') final String? bio,
      @JsonKey(name: 'avatar') final String? avatar,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'linkedIn') final String? linkedIn,
      @JsonKey(name: 'github') final String? github,
      @JsonKey(name: 'website') final String? website,
      @JsonKey(name: 'skills') final List<String>? skills,
      @JsonKey(name: 'interests') final List<String>? interests,
      @JsonKey(name: 'experiences') final List<Experience>? experiences,
      @JsonKey(name: 'education') final List<Education>? education,
      @JsonKey(name: 'numRatings') final int? numRatings,
      @JsonKey(name: 'ratingSum') final int? ratingSum}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'location')
  Location? get location;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'bio')
  String? get bio;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'linkedIn')
  String? get linkedIn;
  @override
  @JsonKey(name: 'github')
  String? get github;
  @override
  @JsonKey(name: 'website')
  String? get website;
  @override
  @JsonKey(name: 'skills')
  List<String>? get skills;
  @override
  @JsonKey(name: 'interests')
  List<String>? get interests;
  @override
  @JsonKey(name: 'experiences')
  List<Experience>? get experiences;
  @override
  @JsonKey(name: 'education')
  List<Education>? get education;
  @override
  @JsonKey(name: 'numRatings')
  int? get numRatings;
  @override
  @JsonKey(name: 'ratingSum')
  int? get ratingSum;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coordinates') List<double>? coordinates});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'type') String? type,
      @JsonKey(name: 'coordinates') List<double>? coordinates});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? coordinates = freezed,
  }) {
    return _then(_$_Location(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<double>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location(
      {@JsonKey(name: 'type') this.type,
      @JsonKey(name: 'coordinates') final List<double>? coordinates})
      : _coordinates = coordinates;

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  @JsonKey(name: 'type')
  final String? type;
  final List<double>? _coordinates;
  @override
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates {
    final value = _coordinates;
    if (value == null) return null;
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Location(type: $type, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
          {@JsonKey(name: 'type') final String? type,
          @JsonKey(name: 'coordinates') final List<double>? coordinates}) =
      _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'coordinates')
  List<double>? get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  @JsonKey(name: 'employerName')
  String? get employerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'startYear')
  String? get startYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'endYear')
  String? get endYear => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) then) =
      _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call(
      {@JsonKey(name: 'employerName') String? employerName,
      @JsonKey(name: 'startYear') String? startYear,
      @JsonKey(name: 'role') String? role,
      @JsonKey(name: 'endYear') String? endYear,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employerName = freezed,
    Object? startYear = freezed,
    Object? role = freezed,
    Object? endYear = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      startYear: freezed == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      endYear: freezed == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperienceCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$_ExperienceCopyWith(
          _$_Experience value, $Res Function(_$_Experience) then) =
      __$$_ExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'employerName') String? employerName,
      @JsonKey(name: 'startYear') String? startYear,
      @JsonKey(name: 'role') String? role,
      @JsonKey(name: 'endYear') String? endYear,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$_ExperienceCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$_Experience>
    implements _$$_ExperienceCopyWith<$Res> {
  __$$_ExperienceCopyWithImpl(
      _$_Experience _value, $Res Function(_$_Experience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employerName = freezed,
    Object? startYear = freezed,
    Object? role = freezed,
    Object? endYear = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Experience(
      employerName: freezed == employerName
          ? _value.employerName
          : employerName // ignore: cast_nullable_to_non_nullable
              as String?,
      startYear: freezed == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      endYear: freezed == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Experience implements _Experience {
  const _$_Experience(
      {@JsonKey(name: 'employerName') this.employerName,
      @JsonKey(name: 'startYear') this.startYear,
      @JsonKey(name: 'role') this.role,
      @JsonKey(name: 'endYear') this.endYear,
      @JsonKey(name: '_id') this.id});

  factory _$_Experience.fromJson(Map<String, dynamic> json) =>
      _$$_ExperienceFromJson(json);

  @override
  @JsonKey(name: 'employerName')
  final String? employerName;
  @override
  @JsonKey(name: 'startYear')
  final String? startYear;
  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  @JsonKey(name: 'endYear')
  final String? endYear;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'Experience(employerName: $employerName, startYear: $startYear, role: $role, endYear: $endYear, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Experience &&
            (identical(other.employerName, employerName) ||
                other.employerName == employerName) &&
            (identical(other.startYear, startYear) ||
                other.startYear == startYear) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.endYear, endYear) || other.endYear == endYear) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, employerName, startYear, role, endYear, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      __$$_ExperienceCopyWithImpl<_$_Experience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExperienceToJson(
      this,
    );
  }
}

abstract class _Experience implements Experience {
  const factory _Experience(
      {@JsonKey(name: 'employerName') final String? employerName,
      @JsonKey(name: 'startYear') final String? startYear,
      @JsonKey(name: 'role') final String? role,
      @JsonKey(name: 'endYear') final String? endYear,
      @JsonKey(name: '_id') final String? id}) = _$_Experience;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$_Experience.fromJson;

  @override
  @JsonKey(name: 'employerName')
  String? get employerName;
  @override
  @JsonKey(name: 'startYear')
  String? get startYear;
  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(name: 'endYear')
  String? get endYear;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  @JsonKey(name: 'instituteName')
  String? get instituteName => throw _privateConstructorUsedError;
  @JsonKey(name: 'startYear')
  String? get startYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'endYear')
  String? get endYear => throw _privateConstructorUsedError;
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {@JsonKey(name: 'instituteName') String? instituteName,
      @JsonKey(name: 'startYear') String? startYear,
      @JsonKey(name: 'endYear') String? endYear,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituteName = freezed,
    Object? startYear = freezed,
    Object? endYear = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      instituteName: freezed == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String?,
      startYear: freezed == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as String?,
      endYear: freezed == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'instituteName') String? instituteName,
      @JsonKey(name: 'startYear') String? startYear,
      @JsonKey(name: 'endYear') String? endYear,
      @JsonKey(name: '_id') String? id});
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instituteName = freezed,
    Object? startYear = freezed,
    Object? endYear = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Education(
      instituteName: freezed == instituteName
          ? _value.instituteName
          : instituteName // ignore: cast_nullable_to_non_nullable
              as String?,
      startYear: freezed == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as String?,
      endYear: freezed == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {@JsonKey(name: 'instituteName') this.instituteName,
      @JsonKey(name: 'startYear') this.startYear,
      @JsonKey(name: 'endYear') this.endYear,
      @JsonKey(name: '_id') this.id});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  @JsonKey(name: 'instituteName')
  final String? instituteName;
  @override
  @JsonKey(name: 'startYear')
  final String? startYear;
  @override
  @JsonKey(name: 'endYear')
  final String? endYear;
  @override
  @JsonKey(name: '_id')
  final String? id;

  @override
  String toString() {
    return 'Education(instituteName: $instituteName, startYear: $startYear, endYear: $endYear, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.instituteName, instituteName) ||
                other.instituteName == instituteName) &&
            (identical(other.startYear, startYear) ||
                other.startYear == startYear) &&
            (identical(other.endYear, endYear) || other.endYear == endYear) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instituteName, startYear, endYear, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {@JsonKey(name: 'instituteName') final String? instituteName,
      @JsonKey(name: 'startYear') final String? startYear,
      @JsonKey(name: 'endYear') final String? endYear,
      @JsonKey(name: '_id') final String? id}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  @JsonKey(name: 'instituteName')
  String? get instituteName;
  @override
  @JsonKey(name: 'startYear')
  String? get startYear;
  @override
  @JsonKey(name: 'endYear')
  String? get endYear;
  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}
