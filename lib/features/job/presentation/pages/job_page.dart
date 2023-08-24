import 'package:go_router/go_router.dart';
import 'package:handyman/features/job/presentation/widgets/list_all_job.dart';
import 'package:flutter/material.dart';
import 'package:handyman/routes/routes_constant.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {context.go("${RoutesConstant.job}/add")},
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(children: [
        const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                "All Job List",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 25,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
          child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: height - 140, maxWidth: width - 32),
              child: const Expanded(child: ListAllJob())),
        ),
      ])),
    );
  }
}
