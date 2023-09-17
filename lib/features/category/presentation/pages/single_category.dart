import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/features/job/data/models/category_model.dart';
import 'package:handyman/routes/routes_constant.dart';

import '../../../../core/constants/constants.dart';

class SingleCategory extends StatefulHookWidget {
  final CategoryModel category;
  const SingleCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          {context.go("${RoutesConstant.categories}/${widget.category.id}")},
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        height: 80,
                        width: 80,
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.3),
                        child: SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Image.network(
                                "${AppConstants.fileUrl}${widget.category.image}"),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      widget.category.title ?? "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: _getStatusColor(
                          widget.category.status.toString(),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "${widget.category.status}",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Color _getStatusColor(String status) {
  switch (status) {
    case "active":
      return const Color(0xFF0F9686);
    default:
      return const Color(0xFFEB3F3F);
    // Default color if status doesn't match any of the above
  }
}

String giveDate(String? datetimeString) {
  final getDate = datetimeString != null && datetimeString.isNotEmpty
      ? DateTime.parse(datetimeString)
      : DateTime.now();

  String convertedDate =
      "${getDate.year.toString()}-${getDate.month.toString().padLeft(2, '0')}-${getDate.day.toString().padLeft(2, '0')}";

  return convertedDate;
}

String giveTime(String? datetimeString) {
  final getDate = datetimeString != null && datetimeString.isNotEmpty
      ? DateTime.parse(datetimeString)
      : DateTime.now();

  String convertedTime =
      "${getDate.hour.toString().padLeft(2, '0')}:${getDate.minute.toString().padLeft(2, '0')}";

  return convertedTime;
}
