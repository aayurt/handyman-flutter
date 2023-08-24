import 'package:flutter/material.dart';
import 'package:handyman/features/job/presentation/widgets/top_job_widget.dart';

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
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HomeHeader(),
            // SearchJob(),
            Text("Carousel"),
            CategoryJobWidget(),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TopJobWidget()),
          ],
        ),
      ),
    ));
  }
}
