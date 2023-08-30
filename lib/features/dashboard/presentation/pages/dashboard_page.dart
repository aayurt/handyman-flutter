import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/job/presentation/widgets/top_job_widget.dart';
import 'package:handyman/features/profile/presentation/bloc/profile_bloc.dart';

import '../../../job/presentation/widgets/categoryJob/category_job_widget.dart';
import '../../../job/presentation/widgets/search_job.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.read<ProfileBloc>().add(const ProfileEvent.get());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state is ProfileStateLoaded) {
                              var profile = state.user;
                              return Text(
                                "Hello! ${profile.name}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              );
                            } else if (state is ProfileStateLoading) {
                              return const CircularProgressIndicator();
                            } else {
                              return const Text(
                                "Hello! User",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "What service do you\nneed Today?",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CategoryJobWidget(),
                const SizedBox(
                  height: 20,
                ),
                const TopJobWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
