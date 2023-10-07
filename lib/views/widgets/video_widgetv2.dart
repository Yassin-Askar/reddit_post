// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:native_video_player/native_video_player.dart';
// import 'package:reddit_post/constants/icons.dart';
// import 'package:reddit_post/constants/videos.dart';
// import 'package:video_player/video_player.dart';

// class VideoWidgetV2 extends StatefulWidget {
//   const VideoWidgetV2({Key? key}) : super(key: key);

//   @override
//   State<VideoWidgetV2> createState() => _VideoWidgetV2State();
// }

// class _VideoWidgetV2State extends State<VideoWidgetV2> {
//   late NativeVideoPlayerController _videoController;
//   bool isPlaying = false;
//   bool initVideo = false;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Align(child: NativeVideoPlayerView(
//           onViewReady: (controller) async {
//             final videoSource = await VideoSource.init(
//               path: videoCats,
//               type: VideoSourceType.asset,
//             );
//             await controller.loadVideoSource(videoSource).then((value) {
//               _videoController = controller;
//               setState(() {
//                 initVideo = true;
//               });
//             });
//           },
//         )),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Row(
//             children: [
//               Expanded(
//                   child: IconButton(
//                 icon: isPlaying
//                     ? SvgPicture.asset(
//                         iconPause,
//                         height: 50,
//                       )
//                     : SvgPicture.asset(
//                         iconPlay,
//                         height: 50,
//                       ),
//                 onPressed: () async {
//                   await _videoController.isPlaying()
//                       ? setState(() {
//                           isPlaying = false;

//                           _videoController.pause();
//                         })
//                       : setState(() {
//                           isPlaying = true;
//                           _videoController.play();
//                         });
//                 },
//               )),
//               initVideo == true
//                   ? Expanded(
//                       flex: 5,
//                       child: Slider(
//                         // min: 0,
//                         max: (_videoController?.videoInfo?.duration ?? 0)
//                             .toDouble(),
//                         value: (_videoController.playbackInfo?.position ?? 0)
//                             .toDouble(),
//                         onChanged: (value) =>
//                             _videoController.seekTo(value.toInt()),
//                       ),
//                     )
//                   : SizedBox(),
//               const Expanded(child: Text("10:8"))
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
