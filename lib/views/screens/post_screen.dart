import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:flutter/material.dart';
import 'package:reddit_post/views/widgets/comments_section_widget.dart';

import '../widgets/post_app_bar_widget.dart';
import '../widgets/post_options_widget.dart';
import '../widgets/post_user_info_widget.dart';
import '../widgets/video_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  FloatingPullUpState floatingPullUpState = FloatingPullUpState.hidden;
  @override
  Widget build(BuildContext context) {
    return FloatingPullUpCardLayout(
      state: floatingPullUpState,
      dismissable: true,
      onOutsideTap: () {
        return FloatingPullUpState.collapsed;
      },
      collpsedStateOffset: (maxHeight, cardHeight) {
        return maxHeight - (maxHeight * (0.01));
      },
      cardColor: Colors.black,
      body: const CommentsSectionWidget(),
      child: Stack(
        children: [
          const VideoWidget(),
          PostOptions(
            onPressed: () {
              setState(() {
                floatingPullUpState = FloatingPullUpState.uncollapsed;
              });
            },
          ),
          const PostAppBarWidget(),
          const Align(
              heightFactor: 6.1,
              alignment: Alignment.bottomLeft,
              child: PostUserInfo()),
        ],
      ),
    );
  }
}
