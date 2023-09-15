import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:handyman/core/shared_pref/shared_pref.dart';
import 'package:handyman/features/job/presentation/widgets/top_job_widget.dart';
import 'package:handyman/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../job/presentation/widgets/categoryJob/category_job_widget.dart';
import '../../../job/presentation/widgets/search_job.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 0), () async {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.read<ProfileBloc>().add(const ProfileEvent.get());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if (state is ProfileStateLoaded) {
                              var profile = state.user;
                              return Text(
                                "Hello! ${profile.name}",
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              );
                            } else if (state is ProfileStateLoading) {
                              return const CircularProgressIndicator();
                            } else {
                              return const Text(
                                "Hello! User",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "What service do you\nneed Today?",
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const GalleryWidget(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CategoryJobWidget(),
                const SizedBox(
                  height: 20,
                ),
                const TopJobWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
      "1.png",
      "2.png",
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
    useEffect(() {
      startTimer();
      return null;
    }, []);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: kWidth(context),
          height: 200,
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
                    itemCount: gallery.length, // Calculate the number of pages
                    controller: pageController,
                    itemBuilder: (context, pageIndex) {
                      String mediaPath = "assets/gallery/${gallery[pageIndex]}";
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
