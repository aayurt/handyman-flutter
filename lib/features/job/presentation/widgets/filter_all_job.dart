import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

import '../bloc/filter_job/filter_job_bloc.dart';

class FilterAllJob extends StatefulWidget {
  final String search;
  const FilterAllJob({Key? key, required this.search}) : super(key: key);

  @override
  _FilterAllJobState createState() => _FilterAllJobState();
}

class _FilterAllJobState extends State<FilterAllJob> {
  @override
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context
          .read<FilterJobBloc>()
          .add(FilterJobEvent.get(search: widget.search));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<FilterJobBloc, FilterJobState>(
      builder: (context, state) {
        if (state is FilterJobStateLoaded) {
          final List<JobModel> jobs = state.jobs;
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (BuildContext context, int index) {
              var job = jobs[index];
              return Padding(
                padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                        height: 150, width: width - 32, child: SingleJob(job))
                  ],
                ),
              );
            },
          );
        } else if (state is AllJobStateLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
