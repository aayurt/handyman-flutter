import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/job/presentation/widgets/list_all_job.dart';
import 'package:flutter/material.dart';
import 'package:handyman/routes/routes_constant.dart';

class JobListPage extends StatefulWidget {
  const JobListPage({Key? key}) : super(key: key);

  @override
  _JobListPageState createState() => _JobListPageState();
}

class _JobListPageState extends State<JobListPage> {
  String userType = "";
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
      if (usertype.isNotEmpty) {
        setState(() {
          userType = usertype;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      floatingActionButton: userType == "Contractor"
          ? FloatingActionButton(
              onPressed: () => {context.go("${RoutesConstant.job}/add")},
              child: const Icon(Icons.add),
            )
          : null,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  height: 25,
                  width: 25,
                  child: GestureDetector(
                      onTap: () {
                        context.go(RoutesConstant.dashboard);
                      },
                      child: const Icon(Icons.arrow_back))),
              const Expanded(
                child: Text(
                  "Your Services",
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
                constraints: BoxConstraints(
                    maxHeight: height - 140, maxWidth: width - 32),
                child: const Expanded(child: ListAllJob())),
          ),
        ]),
      )),
    );
  }
}
