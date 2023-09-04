import 'package:handyman/app.dart';
import 'package:handyman/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:handyman/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/filter_job/filter_job_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/single_category/single_category_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/single_job/single_job_bloc.dart';
import 'package:handyman/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/top_job/top_job_bloc.dart';
import 'package:handyman/features/order/presentation/bloc/order_bloc.dart';

import 'features/order/presentation/bloc/single_application/single_application_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';

class BlocProviderContainer extends StatelessWidget {
  const BlocProviderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (BuildContext context) => LoginBloc(),
      ),
      BlocProvider<DashboardBloc>(
        create: (BuildContext context) => DashboardBloc(),
      ),
      BlocProvider<TopJobBloc>(
        create: (BuildContext context) => TopJobBloc(),
      ),
      BlocProvider<AllJobBloc>(
        create: (BuildContext context) => AllJobBloc(),
      ),
      BlocProvider<ProfileBloc>(
        create: (BuildContext context) => ProfileBloc(),
      ),
      BlocProvider<SingleJobBloc>(
        create: (BuildContext context) => SingleJobBloc(),
      ),
      BlocProvider<CategoryJobBloc>(
        create: (BuildContext context) => CategoryJobBloc(),
      ),
      BlocProvider<OrderBloc>(
        create: (BuildContext context) => OrderBloc(),
      ),
      BlocProvider<SingleApplicationBloc>(
        create: (BuildContext context) => SingleApplicationBloc(),
      ),
      BlocProvider<FilterJobBloc>(
        create: (BuildContext context) => FilterJobBloc(),
      ),
      BlocProvider<ChatBloc>(
        create: (BuildContext context) => ChatBloc(),
      ),
      BlocProvider<SingleCategoryBloc>(
        create: (BuildContext context) => SingleCategoryBloc(),
      ),
    ], child: const App());
  }
}
