import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_list.dart';
import '../../../../core/network/api_service.dart';
import '../../../login/data/models/login_api_response_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileStateInitial()) {
    on<_ProfileEventGet>((event, emit) async {
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const ProfileState.loading());

      if (baseUrl.isNotEmpty) {
        final response = await request.get(
          ApiEndpoint(baseUrl, ApiList.profile, {}),
        );
        if (response.statusCode == 200) {
          final User user = User.fromJson(response.data["data"]);
          emit(ProfileState.loaded(user: user));
        } else {
          emit(const ProfileState.error());
        }
      }
    });
  }
}
