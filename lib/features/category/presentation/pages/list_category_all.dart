import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/category/presentation/pages/single_category.dart';
import 'package:handyman/features/job/data/models/category_model.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';

class ListAllCategory extends StatefulWidget {
  const ListAllCategory({
    Key? key,
  }) : super(key: key);

  @override
  _ListAllCategoryJobState createState() => _ListAllCategoryJobState();
}

class _ListAllCategoryJobState extends State<ListAllCategory> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return BlocBuilder<CategoryJobBloc, CategoryJobState>(
      builder: (context, state) {
        if (state is CategoryJobStateLoading) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()),
            ],
          );
        } else if (state is CategoryJobStateLoaded) {
          final List<CategoryModel> dataList = state.categories;
          if (dataList.isEmpty) return const Text("No data found.");
          return ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) {
              var category = dataList[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: <Widget>[
                      SizedBox(
                          height: 150,
                          width: width - 20,
                          child: SingleCategory(category: category))
                    ],
                  ),
                ],
              );
            },
          );
        } else {
          return const Text("Error");
        }
      },
    );
  }
}
