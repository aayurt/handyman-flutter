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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.category.title ?? "",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "£${widget.category.title}",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const Text(
                        "/hr",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
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
                      child: Image.network(
                          "${AppConstants.fileUrl}${widget.category.image}",
                          fit: BoxFit.cover),
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
    case "pending":
      return Colors.yellow;
    case "accepted":
      return const Color(0xFFEF8D32);
    case "completed":
      return const Color(0xFF0F9686);
    case "cancelled":
      return const Color(0xFFEB3F3F);
    default:
      return Colors
          .grey; // Default color if status doesn't match any of the above
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
