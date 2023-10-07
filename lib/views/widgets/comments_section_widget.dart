import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_post/controllers/post/post_controller.dart';
import 'package:reddit_post/models/comment.dart';
import 'package:reddit_post/views/widgets/comment_widget.dart';
import 'package:reddit_post/views/widgets/post_user_info_widget.dart';

import '../../state/comment_provider.dart';

class CommentsSectionWidget extends StatelessWidget {
  const CommentsSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController commentController = TextEditingController();
    ScrollController listScrollController = ScrollController();

    final commentsProvider = Provider.of<CommentsProvider>(context);
    commentsProvider.setComments(comments);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 110,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      child: const PostUserInfo()),
                ),
              ],
            ),
          ),
          Container(
            height: 380,
            child: ListView.builder(
              itemCount: commentsProvider.comments!.length,
              controller: listScrollController,
              itemBuilder: (BuildContext context, int index) {
                return CommentWidget(
                  key: Key(index.toString()),
                  comment:
                      commentsProvider.comments![comments.length - 1 - index],
                );
              },
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: commentController,
            onFieldSubmitted: (value) {
              print(value);
              var comment = Comment(
                  id: 1,
                  pic: "assets/pics/p1.png",
                  replies: [],
                  text: value,
                  username: "yassin",
                  votes: 0);
              commentsProvider.addComment(comment);
              commentController.clear();
              listScrollController.animateTo(
                1,
                duration: Duration(seconds: 1),
                curve: Curves.linear,
              );
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              label: Text(
                "add a comment",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
              filled: true,
              fillColor: Colors.black12,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0.0),
                borderSide: const BorderSide(
                  color: Colors.black12,
                ),
              ),
              prefixIconColor: Colors.grey,
              labelStyle:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
