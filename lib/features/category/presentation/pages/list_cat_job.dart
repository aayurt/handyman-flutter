import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/single_category/single_category_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/single_job.dart';

class ListCategoryJobWidget extends StatefulWidget {
  final int? items;
  const ListCategoryJobWidget({Key? key, this.items}) : super(key: key);

  @override
  _ListCategoryJobWidgetState createState() => _ListCategoryJobWidgetState();
}

class _ListCategoryJobWidgetState extends State<ListCategoryJobWidget> {
  @override
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<CategoryJobBloc>().add(const CategoryJobEvent.get());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<SingleCategoryBloc, SingleCategoryState>(
      builder: (context, state) {
        if (state is SingleCategoryStateLoaded) {
          final List<JobModel> jobs = state.jobs;
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: jobs.length,
            itemBuilder: (BuildContext context, int index) {
              var category = jobs[index];
              return Padding(
                padding: EdgeInsets.only(top: index != 0 ? 12.0 : 0),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: width - 32, child: SingleJob(job: category))
                  ],
                ),
              );
            },
          );
        } else if (state is SingleCategoryStateLoading) {
          return const CircularProgressIndicator();
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
