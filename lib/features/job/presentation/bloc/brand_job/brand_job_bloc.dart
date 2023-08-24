import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_job_event.dart';
part 'brand_job_state.dart';
part 'brand_job_bloc.freezed.dart';

class BrandJobBloc extends Bloc<BrandJobEvent, BrandJobState> {
  BrandJobBloc() : super(const BrandJobStateInitial()) {
    on<BrandJobEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
