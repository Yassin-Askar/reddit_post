import 'package:flutter/material.dart';

import 'package:reddit_post/constants/videos.dart';
import 'package:video_player/video_player.dart';

import 'video_options_widget.dart';

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset(videoCats)
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
        _videoController.setLooping(true);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: _videoController.value.isInitialized
              ? SizedBox(
                  width: double.infinity,
                  child: LayoutBuilder(builder: (context, constraints) {
                    return AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: constraints.maxWidth,
                            maxHeight: constraints.maxHeight /
                                _videoController.value.aspectRatio,
                          ),
                          child: VideoPlayer(_videoController)),
                    );
                  }),
                )
              : Container(),
        ),
        VideoOptions(videoController: _videoController)
      ],
    );
  }
}
