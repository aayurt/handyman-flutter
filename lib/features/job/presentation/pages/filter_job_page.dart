import 'package:handyman/features/job/presentation/widgets/filter_all_job.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterJobPage extends StatefulWidget {
  const FilterJobPage({Key? key, required this.search}) : super(key: key);
  final String search;
  @override
  _FilterJobPageState createState() => _FilterJobPageState();
}

class _FilterJobPageState extends State<FilterJobPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
              child: Expanded(child: FilterAllJob(search: widget.search))),
        ),
      ])),
    );
  }
}
