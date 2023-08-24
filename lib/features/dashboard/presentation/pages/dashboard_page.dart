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
        child: Padding(
          padding: EdgeInsets.only(top: 30, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello! Manish",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "What service do you\nneed Today?",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                CategoryJobWidget(),
                TopJobWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
