import 'package:flutter/material.dart';

import '../models/comment.dart';

class CommentsProvider extends ChangeNotifier {
  List<Comment>? comments;

  CommentsProvider({this.comments});

  void setComments(List<Comment>? com) {
    comments = com;
  }

  void addComment(Comment comment) {
    comments?.add(comment);
    notifyListeners();
  }

  void deleteComment(Comment comment) {
    comments?.remove(comment);
    notifyListeners();
  }

  void editComment(int index, Comment newComment) {
    if (comments != null && index >= 0 && index < comments!.length) {
      comments![index] = newComment;
      notifyListeners();
    } else {}
  }
}
