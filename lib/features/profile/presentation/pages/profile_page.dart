import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:handyman/features/profile/presentation/pages/profile_form_update.dart'
    if (dart.library.js) 'package:handyman/features/profile/presentation/pages/profile_form_update_web.dart';
import 'package:handyman/routes/routes_constant.dart';
import 'package:video_player/video_player.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userType = "";
  List<String> gallery =
      ["fix_leak.mp4", "frayed_wire_fix.mp4", "mold_fix.mp4"].reversed.toList();

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.read<ProfileBloc>().add(const ProfileEvent.get());
        var usertype = await SharedPrefService.getToken(SharedPrefKey.userType);
        if (usertype.isNotEmpty) {
          setState(() {
            userType = usertype;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 30,
                      ),
                      Expanded(
                        child: Text(
                          "$userType Update",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  // const TabBar(
                  //   tabs: [
                  //     Tab(text: 'Profile'),
                  //     Tab(text: 'Graphs'),
                  //   ],
                  // ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        BlocConsumer<ProfileBloc, ProfileState>(
                          listener: (context, state) {
                            if (state is ProfileStateError) {
                              context.go(RoutesConstant.login);
                            }
                          },
                          builder: (context, state) {
                            if (state is ProfileStateLoaded) {
                              var userModelData = state.user;
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16, right: 16),
                                child: ProfileFormUpdate(
                                    userModelData: userModelData),
                              );
                            } else if (state is ProfileStateLoading) {
                              return const Center(
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator()));
                            } else {
                              return const Text("Error");
                            }
                          },
                        ),
                        // GraphContent()
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 2,
                left: 10,
                child: ElevatedButton(
                  onPressed: () async {
                    await SharedPrefService.storeToken(SharedPrefKey.token, "");
                    await SharedPrefService.storeToken(
                        SharedPrefKey.userType, "");
                    context.go(RoutesConstant.login);
                  },
                  child: const Text("Logout"),
                ),
              ),
              Positioned(
                right: 10,
                child: TextButton(
                  onPressed: () async {
                    context.go(RoutesConstant.faq);
                  },
                  child: PopupMenuButton<String>(
                    color: Theme.of(context).colorScheme.primary,
                    itemBuilder: (BuildContext popUpcontext) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'FAQ',
                        child: const Text('FAQ'),
                        onTap: () {
                          popUpcontext.go(RoutesConstant.faq);
                        },
                      ),
                      PopupMenuItem<String>(
                        onTap: (() {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const GalleryWidget();
                            },
                          );
                        }),
                        value: 'Video Tutorial',
                        child: const Text('Video Tutorial'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

// class GraphContent extends StatelessWidget {
//   GraphContent({Key? key}) : super(key: key);
//   List<_SalesData> data = [
//     _SalesData('Jan', 35),
//     _SalesData('Feb', 28),
//     _SalesData('Mar', 34),
//     _SalesData('Apr', 32),
//     _SalesData('May', 40)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       //Initialize the chart widget
//       SfCartesianChart(
//           primaryXAxis: CategoryAxis(),
//           // Chart title
//           title: ChartTitle(text: 'Half yearly sales analysis'),
//           // Enable legend
//           legend: const Legend(isVisible: true),
//           // Enable tooltip
//           tooltipBehavior: TooltipBehavior(enable: true),
//           series: <ChartSeries<_SalesData, String>>[
//             LineSeries<_SalesData, String>(
//                 dataSource: data,
//                 xValueMapper: (_SalesData sales, _) => sales.year,
//                 yValueMapper: (_SalesData sales, _) => sales.sales,
//                 name: 'Sales',
//                 // Enable data label
//                 dataLabelSettings: const DataLabelSettings(isVisible: true))
//           ]),
//       Expanded(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           //Initialize the spark charts widget
//           child: SfSparkLineChart.custom(
//             //Enable the trackball
//             trackball: const SparkChartTrackball(
//                 activationMode: SparkChartActivationMode.tap),
//             //Enable marker
//             marker: const SparkChartMarker(
//                 displayMode: SparkChartMarkerDisplayMode.all),
//             //Enable data label
//             labelDisplayMode: SparkChartLabelDisplayMode.all,
//             xValueMapper: (int index) => data[index].year,
//             yValueMapper: (int index) => data[index].sales,
//             dataCount: 5,
//           ),
//         ),
//       )
//     ]);
//   }
// }
class GalleryWidget extends StatefulHookWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  _GalleryWidgetState createState() => _GalleryWidgetState();
}

class _GalleryWidgetState extends State<GalleryWidget> {
  late PageController pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: _currentPage);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> gallery = [
      "fix_leak.mp4",
      "frayed_wire_fix.mp4",
      "mold_fix.mp4"
    ].reversed.toList();
    void startTimer() {
      var itemsLength = gallery.length;
      Timer.periodic(const Duration(seconds: 8), (Timer timer) {
        if (_currentPage < itemsLength - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        setState(() {});
      });
    }

    useEffect(() {
      if (mounted && pageController.hasClients) {
        pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
      return null;
    }, [_currentPage]);
    // useEffect(() {
    //   startTimer();
    //   return null;
    // }, []);

    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: kWidth(context),
            height: MediaQuery.of(context).size.height - 188,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (_currentPage == 0) {
                      _currentPage = gallery.length - 1;
                    } else {
                      _currentPage = _currentPage - 1;
                    }
                    setState(() {});
                  },
                ),
                Expanded(
                  child: PageView.builder(
                      itemCount:
                          gallery.length, // Calculate the number of pages
                      controller: pageController,
                      itemBuilder: (context, pageIndex) {
                        String mediaPath =
                            "assets/gallery/${gallery[pageIndex]}";
                        if (mediaPath.endsWith('.png')) {
                          return Image.asset(
                            mediaPath,
                            fit: BoxFit.contain,
                          );
                        } else if (mediaPath.endsWith('.mp4')) {
                          return VideoPlayerWidget(videoPath: mediaPath);
                        }
                        return Container();
                      }),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    if (_currentPage == gallery.length - 1) {
                      _currentPage = 0;
                    } else {
                      _currentPage = _currentPage + 1;
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

double kHeight(context) {
  return MediaQuery.of(context).size.height;
}

double kWidth(context) {
  return MediaQuery.of(context).size.width;
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown and play the video
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: FloatingActionButton(
              backgroundColor: Colors.white.withOpacity(0.1),
              onPressed: () {
                setState(() {
                  _videoController.value.isPlaying
                      ? _videoController.pause()
                      : _videoController.play();
                });
              },
              child: Icon(
                _videoController.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }
}
