// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoCarouselModalWidget extends StatefulWidget {
//   final List<String> gallery;

//   const VideoCarouselModalWidget({super.key, required this.gallery});

//   @override
//   _VideoCarouselModalWidgetState createState() =>
//       _VideoCarouselModalWidgetState();
// }

// class _VideoCarouselModalWidgetState extends State<VideoCarouselModalWidget> {
//   final PageController _pageController = PageController();
//   final _currentPageNotifier = ValueNotifier<int>(0);
//   late List<VideoPlayerController> _controllers;

//   @override
//   void initState() {
//     super.initState();
//     _controllers = widget.gallery.map((url) {
//       final controller = VideoPlayerController.network(url);
//       controller.initialize().then((_) {
//         setState(() {});
//       });
//       return controller;
//     }).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Video Carousel'),
//       content: SizedBox(
//         height: 300, // Adjust the height as needed
//         child: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: widget.gallery.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return VideoPlayerWidget(controller: _controllers[index]);
//                 },
//                 onPageChanged: (int index) {
//                   _currentPageNotifier.value = index;
//                 },
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.all(8.0),
//             //   child: CirclePageIndicator(
//             //     itemCount: widget.gallery.length,
//             //     currentPageNotifier: _currentPageNotifier,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () {
//             for (var controller in _controllers) {
//               controller.pause();
//               controller.dispose();
//             }
//             Navigator.of(context).pop();
//           },
//           child: const Text('Close'),
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
// }

// class VideoPlayerWidget extends StatelessWidget {
//   final VideoPlayerController controller;

//   const VideoPlayerWidget({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
//       child: VideoPlayer(controller),
//     );
//   }
// }
