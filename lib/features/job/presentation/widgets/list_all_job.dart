import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

class ListAllJob extends StatefulWidget {
  final int? items;
  const ListAllJob({Key? key, this.items}) : super(key: key);

  @override
  _ListAllJobState createState() => _ListAllJobState();
}

class _ListAllJobState extends State<ListAllJob> {
  @override
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AllJobBloc>().add(const AllJobEvent.get());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<AllJobBloc, AllJobState>(
      builder: (context, state) {
        if (state is AllJobStateLoaded) {
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
                    SizedBox(width: width - 32, child: SingleJob(job: job))
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
