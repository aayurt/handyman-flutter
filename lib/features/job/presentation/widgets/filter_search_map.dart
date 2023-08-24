import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

class FilterSearchMap extends StatefulWidget {
  final List<JobModel> jobs;
  const FilterSearchMap({Key? key, required this.jobs}) : super(key: key);

  @override
  _FilterSearchMapState createState() => _FilterSearchMapState();
}

class _FilterSearchMapState extends State<FilterSearchMap> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final List<JobModel> jobs = widget.jobs;
    return const SizedBox(
      height: 200,
      child: SizedBox(),
    );
  }
}
