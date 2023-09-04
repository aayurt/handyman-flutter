import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/features/category/presentation/pages/list_category_all.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        context.go(RoutesConstant.dashboard);
                      },
                      icon: const Icon(Icons.arrow_back))
                ],
              ),
              Container(
                  height: height,
                  padding: const EdgeInsets.all(5),
                  child: const ListAllCategory()),
            ],
          ),
        ),
      ),
    );
  }
}
