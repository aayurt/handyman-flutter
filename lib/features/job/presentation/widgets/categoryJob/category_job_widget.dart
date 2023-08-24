import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:handyman/features/job/data/models/category_model.dart';
import 'package:handyman/features/job/presentation/bloc/category_job/category_job_bloc.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/constants.dart';

class CategoryJobWidget extends StatefulWidget {
  const CategoryJobWidget({Key? key}) : super(key: key);

  @override
  _CategoryJobWidgetState createState() => _CategoryJobWidgetState();
}

class _CategoryJobWidgetState extends State<CategoryJobWidget> {
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
    final width = size.width;

    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CategoryJobBloc, CategoryJobState>(
              builder: (context, state) {
                if (state is CategoryJobStateLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CategoryJobStateLoaded) {
                  var categories = state.categories;
                  return Row(
                    children: [
                      SizedBox(
                        width: width - 32,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: false,
                          itemCount:
                              categories.length > 10 ? 8 : categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            CategoryModel? category = categories.isNotEmpty
                                ? categories[index]
                                : null;

                            return GestureDetector(
                              onTap: () {
                                GoRouter.of(context).go(RoutesConstant.transfer,
                                    extra: category);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index != 0 ? 12.0 : 0),
                                child: SizedBox(
                                  width: 60,
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            color: Colors.grey.withOpacity(0.1),
                                            child: SizedBox(
                                                child: Image.network(
                                                    "${AppConstants.fileUrl}${category?.image}")),
                                          )),
                                      Text(
                                        category!.title ?? "",
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text("Error");
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
