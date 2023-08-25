import 'package:flutter/material.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

class FilterSearch extends StatefulWidget {
  final List<JobModel> jobs;
  const FilterSearch({Key? key, required this.jobs}) : super(key: key);

  @override
  _FilterSearchState createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final List<JobModel> jobs = widget.jobs;
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: jobs.length,
      itemBuilder: (BuildContext context, int index) {
        var job = jobs[index];
        return Padding(
          padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: width - 20, child: SingleJob(job: job))
            ],
          ),
        );
      },
    );
  }
}
