import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:reddit_post/constants/icons.dart';

import '../../constants/const.dart';
import '../../models/comment.dart';
import '../../state/comment_provider.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({Key? key, required this.comment}) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Card(
          color: const Color.fromARGB(221, 14, 13, 13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          child: Container(
              child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          comment.pic!,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${comment.username}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 12, right: 8),
                      child: Text(comment.text!),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (comment.id == 1)
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          void showDeleteDialog(
                              BuildContext context, Comment comment) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: Colors.black,
                                title: const Text('Delete Comment'),
                                actionsAlignment: MainAxisAlignment
                                    .center, // Center the actions

                                content: const Text(
                                    'Are you sure you want to delete this comment?'),
                                actions: <Widget>[
                                  Container(
                                    width: 125,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50), // Rounded border
                                        ),
                                      ),
                                      child: const Text('Cancel',
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 125,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              50), // Rounded border
                                        ),
                                      ),
                                      onPressed: () {
                                        Provider.of<CommentsProvider>(context,
                                                listen: false)
                                            .deleteComment(comment);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          showDeleteDialog(context, comment);
                          // commentsProvider.deleteComment(comment);
                        },
                      ),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8, right: 8),
                      child: Icon(Icons.more_horiz),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 8, right: 8),
                      child: SvgPicture.asset(
                        iconReply,
                        theme: iconTheme,
                      ),
                    ),
                    VotingCommentWidget(
                      votes: comment.votes!,
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}

class VotingCommentWidget extends StatefulWidget {
  const VotingCommentWidget({
    super.key,
    required this.votes,
  });
  final int votes;
  @override
  State<VotingCommentWidget> createState() => _VotingCommentWidgetState();
}

class _VotingCommentWidgetState extends State<VotingCommentWidget> {
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
    int votes = widget.votes;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isUpVote = !isUpVote;
              isDownVote = false;
            });
          },
          icon: isUpVote
              ? SvgPicture.asset(
                  iconUpVoteFill,
                  theme: SvgTheme(currentColor: Colors.orange.shade900),
                ).animate().scale()
              : SvgPicture.asset(
                  iconUpVote,
                  theme: iconTheme,
                ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            "${getVotes(votes)}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isDownVote = !isDownVote;
              isUpVote = false;
            });
          },
          icon: isDownVote
              ? SvgPicture.asset(
                  iconDownVoteFill,
                  theme: SvgTheme(currentColor: Colors.purple.shade900),
                ).animate().scale()
              : SvgPicture.asset(
                  iconDownVote,
                  theme: iconTheme,
                ),
        ),
      ],
    );
  }
}
