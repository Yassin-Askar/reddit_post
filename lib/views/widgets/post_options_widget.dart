import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reddit_post/constants/icons.dart';
import 'package:share_plus/share_plus.dart';

import '../../constants/const.dart';

class PostOptions extends StatefulWidget {
  const PostOptions({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  State<PostOptions> createState() => _PostOptionsState();
}

class _PostOptionsState extends State<PostOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          height: 300,
          width: 70,
          child: Column(
            children: [
              const Expanded(flex: 2, child: VotingWidget()),
              Expanded(
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: SvgPicture.asset(
                    iconComment,
                    width: 40,
                    theme: iconTheme,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Share.share('cat post on reddit ', subject: 'reddit!');
                  },
                  icon: SvgPicture.asset(
                    iconShare,
                    width: 40,
                    theme: iconTheme,
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

class VotingWidget extends StatefulWidget {
  const VotingWidget({
    super.key,
  });

  @override
  State<VotingWidget> createState() => _VotingWidgetState();
}

class _VotingWidgetState extends State<VotingWidget> {
  bool isUpVote = false;
  bool isDownVote = false;

  int getVotes(int votes) {
    if (isUpVote) {
      return votes + 1;
    } else if (isDownVote) {
      return votes - 1;
    } else {
      return votes;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isUpVote = !isUpVote;
                  isDownVote = false;
                });
              },
              icon: isUpVote
                  ? SvgPicture.asset(iconUpVoteFill,
                          theme: SvgTheme(currentColor: Colors.orange.shade900),
                          width: 50,
                          height: 50)
                      .animate()
                      .scale()
                  : SvgPicture.asset(iconUpVote,
                      theme: iconTheme, width: 50, height: 50),
            )),
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Text(
            "${getVotes(150)}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        )),
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: () {
              setState(() {
                isDownVote = !isDownVote;
                isUpVote = false;
              });
            },
            icon: isDownVote
                ? SvgPicture.asset(iconDownVoteFill,
                        theme: SvgTheme(currentColor: Colors.purple.shade900),
                        width: 50,
                        height: 50)
                    .animate()
                    .scale()
                : SvgPicture.asset(iconDownVote,
                    theme: iconTheme, width: 50, height: 50),
          ),
        ),
      ],
    );
  }
}
