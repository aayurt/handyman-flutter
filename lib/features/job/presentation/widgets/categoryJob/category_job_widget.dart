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
                  onPressed: () {
                    context.go(RoutesConstant.categories);
                  },
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
                        height: 130,
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
                                context.go(
                                    "${RoutesConstant.categories}/${category.id}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 100,
                                  width: 110,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.5)),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Container(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.3),
                                            child: SizedBox(
                                              height: 70,
                                              child: Image.network(
                                                  "${AppConstants.fileUrl}${category?.image}"),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        category!.title ?? "",
                                        overflow: TextOverflow.visible,
                                        textAlign: TextAlign.center,
                                      ),
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
