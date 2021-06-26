import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScrollPage extends StatefulWidget {
  @override
  _VideoScrollPageState createState() => _VideoScrollPageState();
}

class _VideoScrollPageState extends State<VideoScrollPage> {
  // Map<int, VideoPlayerController> _controllers = new HashMap();
  // late VideoPlayerController _controller;
  late PageController _pageViewController = PageController(initialPage: 0);
  // late VideoPlayer _player;
  // int currentIndex = -1;

  List<String> _videoLists = [
    'https://storage.googleapis.com/pst-framy/vdo/!A7_o7epRK!.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'http://pst.framy.co/vdo/!Aj1DW_G2ZV.mp4',
    'http://pst.framy.co/vdo/!AiAXzYjha~.mp4',
    'http://pst.framy.co/vdo/!9Yrn8LnvE!.mp4',
    'http://pst.framy.co/vdo/!9I4tBIRHS~.mp4',
    'http://pst.framy.co/vdo/!B0JnpA_OW~.mp4',
    'http://pst.framy.co/vdo/!AjZloKWMN!.mp4',
    'http://pst.framy.co/vdo/!AjSzpcbm2!.mp4',
    'http://pst.framy.co/vdo/!B2Zug9oUb~.mp4',
    'http://pst.framy.co/vdo/!B2A!YJJHJ!.mp4',
    'http://pst.framy.co/vdo/!B2TnYqOhe~.mp4',
    'http://pst.framy.co/vdo/!B29RUzPIS~.mp4',
    'http://pst.framy.co/vdo/!B27Mo3PVy~.mp4',
    'http://pst.framy.co/vdo/!B1ynMHQLU~.mp4',
    'http://pst.framy.co/vdo/!B1zqX!Z1z~.mp4',
    'http://pst.framy.co/vdo/!B2DOkxJXy~.mp4',
    'http://pst.framy.co/vdo/!B24TTxIZb!.mp4',
    'http://pst.framy.co/vdo/!B0GiPmNkd~.mp4',
    'http://pst.framy.co/vdo/!B0FBXhzrhV.mp4',
    'http://pst.framy.co/vdo/!B0Gm3qnUT~.mp4',
    'http://pst.framy.co/vdo/!B0IAPbK9w~.mp4',
    'http://pst.framy.co/vdo/!A2WcLrp7OV.mp4',
    'http://pst.framy.co/vdo/!A2VetnxUf~.mp4',
    'http://pst.framy.co/vdo/!A!SvtotlI~.mp4',
    'http://pst.framy.co/vdo/!9zc7HOPJP!.mp4',
    'http://pst.framy.co/vdo/!9z_NDi0MSV.mp4',
    'http://pst.framy.co/vdo/!9zZxDbYG8~.mp4',
    'http://pst.framy.co/vdo/!9zWhwSVR5~.mp4',
    'http://pst.framy.co/vdo/!9zUeLiBaRV.mp4',
    'http://pst.framy.co/vdo/!9zO7F9w!r!.mp4',
    'http://pst.framy.co/vdo/!9zKYXOetl!.mp4',
    'http://pst.framy.co/vdo/!9z9msaCjSV.mp4',
    'http://pst.framy.co/vdo/!9z9b0mIM5V.mp4',
    'http://pst.framy.co/vdo/!9z5kYe78K~.mp4',
  ];

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    //   // closedCaptionFile: _loadCaptions(),
    //   videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    // );
    //
    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.initialize();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
              scrollDirection: Axis.horizontal,
              controller: _pageViewController,
              children: createVideoViews())
          // child: SingleChildScrollView(
          //   child: Column(
          //     children: <Widget>[
          //       Container(padding: const EdgeInsets.only(top: 20.0)),
          //       const Text('With remote mp4'),
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   child: AspectRatio(
          //     aspectRatio: 1 / _controller.value.aspectRatio,
          //     child: Stack(
          //       alignment: Alignment.bottomCenter,
          //       children: <Widget>[
          //         VideoPlayer(_controller),
          //         // ClosedCaption(text: _controller.value.caption.text),
          //         _ControlsOverlay(controller: _controller),
          //         // VideoProgressIndicator(_controller, allowScrubbing: true),
          //       ],
          //     ),
          //   ),
          // ),
          //     ],
          //   ),
          // ),
          ),
    );
  }

  List<VideoViewWidget> createVideoViews() {
    List<VideoViewWidget> videoViewList = <VideoViewWidget>[];
    for (String url in _videoLists) {
      videoViewList.add(VideoViewWidget(url: url));
    }

    return videoViewList;
  }
}

class VideoViewWidget extends StatefulWidget {
  const VideoViewWidget({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  _VideoViewWidgetState createState() => _VideoViewWidgetState();
}

class _VideoViewWidgetState extends State<VideoViewWidget> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    debugPrint('initState');
    _controller = VideoPlayerController.network(
      '${widget.url}',
      // closedCaptionFile: _loadCaptions(),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:
            AspectRatio(aspectRatio: 9 / 16, child: VideoPlayer(_controller)));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    debugPrint('Dispose');
  }
}

// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({Key? key, required this.controller})
//       : super(key: key);
//
//   static const _examplePlaybackRates = [
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0,
//   ];
//
//   final VideoPlayerController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//             color: Colors.black26,
//             child: Center(
//               child: Icon(
//                 Icons.play_arrow,
//                 color: Colors.white,
//                 size: 100.0,
//               ),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (context) {
//               return [
//                 for (final speed in _examplePlaybackRates)
//                   PopupMenuItem(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
