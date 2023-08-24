import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/widgets/card/custom_card.dart';
import 'package:handyman/features/job/presentation/bloc/top_job/top_job_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../routes/routes_constant.dart';

class TopJobWidget extends StatefulWidget {
  const TopJobWidget({Key? key}) : super(key: key);

  @override
  _TopJobWidgetState createState() => _TopJobWidgetState();
}

class _TopJobWidgetState extends State<TopJobWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<TopJobBloc>().add(const TopJobEvent.get());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Services Near You",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => {context.go(RoutesConstant.jobs)},
              child: const Text(
                "See All",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<TopJobBloc, TopJobState>(
          builder: (context, state) {
            if (state is TopJobStateLoading) {
              return const CircularProgressIndicator();
            } else if (state is TopJobStateLoaded) {
              final jobs = state.jobs.reversed.toList();

              return Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      // itemCount: jobs.length,
                      itemCount: 15,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.go(
                                "${RoutesConstant.orders}/${jobs[index].id}");
                          },
                          //   child: Padding(
                          //     padding:
                          //         EdgeInsets.only(left: index != 0 ? 16.0 : 0),
                          //     child: Hero(
                          //         tag: '$index',
                          //         child: CustomCardWidget(
                          //           children: Column(
                          //             children: [
                          //               Container(
                          //                   height: 200,
                          //                   width: 200,
                          //                   color: Colors.grey.withOpacity(0.1),
                          //                   child: SizedBox(
                          //                     child: Image.network(jobs[index]
                          //                             .thumbnailImage!
                          //                             .isNotEmpty
                          //                         ? "${AppConstants.fileUrl}${jobs[index].thumbnailImage}"
                          //                         : "https://picsum.photos/250?image=9"),
                          //                   )),
                          //               Text(jobs[index].title ?? ""),
                          //               Text(jobs[index].category!.title ?? ""),
                          //               Text(jobs[index].c  ?? ""),
                          //               // Text(jobs[index]  ""),
                          //               Row(
                          //                 children: [
                          //                   const Text("Pay rate: "),
                          //                   Text(jobs[index].payRate.toString() ??
                          //                       ""),
                          //                 ],
                          //               ),
                          //             ],
                          //           ),
                          //         )),
                          //   ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            child: ListTile(
                              isThreeLine: true,
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.3),
                                  child: Image.network(jobs[index]
                                          .thumbnailImage!
                                          .isNotEmpty
                                      ? "${AppConstants.fileUrl}${jobs[index].thumbnailImage}"
                                      : "https://picsum.photos/250?image=9"),
                                ),
                              ),
                              title: Text(jobs[index].title ?? ""),
                              subtitle: Text(
                                  "${jobs[index].category!.title}\n${jobs[index].contractor!.name}" ??
                                      ""),
                              trailing: Column(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  // Text(serviceProvider['rating'].toString()),
                                  // Text(serviceProvider['distance'] +
                                  //     " km far away"),
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
        )
      ],
    );
  }
}
