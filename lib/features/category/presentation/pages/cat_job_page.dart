import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/category/presentation/pages/list_cat_job.dart';
import 'package:handyman/features/job/presentation/bloc/single_category/single_category_bloc.dart';
import 'package:handyman/features/job/presentation/bloc/single_job/single_job_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';

class CategoryJobPage extends StatefulWidget {
  final String id;
  const CategoryJobPage({Key? key, required this.id}) : super(key: key);

  @override
  _CategoryJobPageState createState() => _CategoryJobPageState();
}

class _CategoryJobPageState extends State<CategoryJobPage> {
  String userType = "";
  @override
  void initState() {
    // TODO: implement initState
    if (widget.id.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context
            .read<SingleCategoryBloc>()
            .add(SingleCategoryEvent.get(id: widget.id ?? ""));
      });
    }

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
                "Your Category jobs",
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
              child: const Expanded(child: ListCategoryJobWidget())),
        ),
      ])),
    );
  }
}
