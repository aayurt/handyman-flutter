import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:handyman/features/order/data/models/application_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/api_list.dart';
import '../../../../core/network/api_service.dart';
import '../../../../core/shared_pref/shared_pref.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const OrderStateInitial()) {
    on<_OrderEventGet>((event, emit) async {
      final ApiService request = ApiService();

      final String baseUrl = AppConstants.baseUrl;
      emit(const OrderState.loading());

      if (baseUrl.isNotEmpty) {
        var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
        final response = await request.get(
          ApiEndpoint(
              baseUrl,
              usertype == "Contractor"
                  ? ApiList.bycontractor
                  : ApiList.bycustomer,
              {}),
          // data: param.toJson(),
        );
        if (response.statusCode == 200) {
          final List applicationResponseData = response.data["data"];
          if (applicationResponseData.isNotEmpty) {
            final List<ApplicationModel> applications =
                applicationResponseData.map(
              (e) {
                print(e);
                return ApplicationModel.fromJson(e);
              },
            ).toList();

            emit(OrderState.loaded(applications: applications));
          } else {
            emit(const OrderState.loaded(applications: []));
          }
        } else if (response.statusCode == 401) {
          emit(const OrderState.error());
        }
      }
    });
  }
}
