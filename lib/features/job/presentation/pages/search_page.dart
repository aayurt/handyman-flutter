import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/filter_all_job.dart';
import 'package:handyman/features/job/presentation/widgets/filter_search.dart';
import 'package:handyman/features/job/presentation/widgets/filter_search_map.dart';
import 'package:handyman/features/job/presentation/widgets/list_all_job.dart';
import 'package:handyman/features/job/presentation/widgets/search_job.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchJobPage extends StatefulWidget {
  const SearchJobPage({Key? key, required this.search}) : super(key: key);
  final String search;
  @override
  _SearchJobPageState createState() => _SearchJobPageState();
}

class _SearchJobPageState extends State<SearchJobPage> {
  String selectedTag = "List";
  List<JobModel> jobs = [];
  List<JobModel> filteredJobs = [];

  final List<String> options = [
    'List',
    'Map',
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<AllJobBloc>().add(const AllJobEvent.get());
    });
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  void applyFilters() {
    setState(() {
      filteredJobs = jobs.where((job) {
        return (job.title!.contains(searchController.text) ||
            job.category!.title!.contains(searchController.text));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return SafeArea(
        child: Column(children: [
      Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          SizedBox(
              height: 25,
              width: 25,
              child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).go(RoutesConstant.dashboard);
                  },
                  child: const Icon(Icons.arrow_back))),
          Expanded(
            child: Text(
              "Job Search: ${widget.search}",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            width: 25,
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
        child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: height - 140, maxWidth: width - 32),
            child: Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(15), // Rounded border radius
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 3), // changes the shadow position
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search job...',
                                border: InputBorder.none,

                                // icon: Icon(Icons.search),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              // Handle search button press
                              applyFilters();
                            },
                            icon: const Icon(Icons.search),
                          ),
                        ],
                      )),
                ),
                Wrap(
                  spacing: 8.0,
                  children: options.map((option) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedTag = option;
                        });
                      },
                      child: Chip(
                        label: Text(option),
                        backgroundColor: selectedTag.contains(option)
                            ? Colors.blue
                            : Colors.grey,
                        labelStyle: TextStyle(
                          color: selectedTag.contains(option)
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                    child: BlocConsumer<AllJobBloc, AllJobState>(
                  listener: (context, state) {
                    if (state is AllJobStateLoaded) {
                      setState(() {
                        jobs = state.jobs;
                        applyFilters();
                      });
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                        height: height - 248,
                        child: selectedTag == "List"
                            ? FilterSearch(jobs: filteredJobs)
                            : FilterSearchMap(jobs: filteredJobs));
                  },
                ))
              ],
            ))),
      ),
    ]));
  }
}
