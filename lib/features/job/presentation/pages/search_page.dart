import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/job_model.dart';
import 'package:handyman/features/job/presentation/bloc/all_job/all_job_bloc.dart';
import 'package:handyman/features/job/presentation/widgets/filter_search.dart';
import 'package:handyman/features/job/presentation/widgets/filter_search_map.dart';

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
        return (job.title!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            job.category!.title!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()));
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
      Expanded(
          child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onBackground,
                  border:
                      Border.all(color: Theme.of(context).colorScheme.primary),
                  borderRadius:
                      BorderRadius.circular(15), // Rounded border radius
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(
                          hintText: 'Search job...',
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Handle search button press
                        applyFilters();
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 5,
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  label: Text(option),
                  backgroundColor: selectedTag.contains(option)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey,
                  labelStyle: TextStyle(
                    color: selectedTag.contains(option)
                        ? Theme.of(context).colorScheme.onPrimary
                        : Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
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
                  height: height - 219,
                  child: selectedTag == "List"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: FilterSearch(jobs: filteredJobs),
                        )
                      : FilterSearchMap(jobs: filteredJobs));
            },
          ))
        ],
      )),
    ]));
  }
}
