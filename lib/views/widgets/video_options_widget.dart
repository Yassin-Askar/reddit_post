import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit_post/constants/const.dart';
import 'package:video_player/video_player.dart';

import '../../constants/icons.dart';

class VideoOptions extends StatefulWidget {
  const VideoOptions({
    Key? key,
    required this.videoController,
  }) : super(key: key);
  final VideoPlayerController videoController;
  @override
  State<VideoOptions> createState() => _VideoOptionsState();
}

class _VideoOptionsState extends State<VideoOptions> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    _videoController = widget.videoController;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
              child: IconButton(
            icon: _videoController.value.isPlaying
                ? SvgPicture.asset(
                    iconPause,
                    height: 50,
                    theme: iconTheme,
                  )
                : SvgPicture.asset(
                    iconPlay,
                    theme: iconTheme,
                    height: 50,
                  ),
            onPressed: () {
              setState(() {
                _videoController.value.isPlaying
                    ? _videoController.pause()
                    : _videoController.play();
              });
            },
          )),
          // Expanded(
          //   flex: 5,
          //   child: VideoProgressIndicator(
          //     padding: const EdgeInsets.all(0),
          //     _videoController,
          //     allowScrubbing: true,
          //     colors: const VideoProgressColors(),
          //   ),
          // ),
          Expanded(
            flex: 5,
            child: ValueListenableBuilder(
                valueListenable: _videoController,
                builder: (context, value, _) {
                  return Container(
                    height: 30,
                    alignment: Alignment.bottomCenter,
                    child: Slider.adaptive(
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey.shade700,
                      max: (value.duration.inSeconds).toDouble(),
                      value: (value.position.inSeconds).toDouble(),
                      onChanged: (value) => _videoController
                          .seekTo(Duration(seconds: value.toInt())),
                    ),
                  );
                }),
          ),
          Expanded(
              flex: 2,
              child: ValueListenableBuilder(
                  valueListenable: _videoController,
                  builder: (context, value, _) {
                    Duration position = _videoController.value.position;
                    Duration remaining =
                        _videoController.value.duration - position;
                    String minutes =
                        (remaining.inMinutes).toString().padLeft(2, "0");
                    String seconds = (remaining.inSeconds.remainder(60))
                        .toString()
                        .padLeft(2, "0");
                    return Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$minutes:$seconds",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                          icon: value.volume == 0.0
                              ? SvgPicture.asset(
                                  iconSoundOff,
                                  height: 50,
                                  theme: iconTheme,
                                )
                              : SvgPicture.asset(
                                  iconSoundOn,
                                  theme: iconTheme,
                                  height: 50,
                                ),
                          onPressed: () {
                            setState(() {
                              value.volume == 0.0
                                  ? _videoController.setVolume(100.0)
                                  : _videoController.setVolume(0.0);
                            });
                          },
                        ))
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
