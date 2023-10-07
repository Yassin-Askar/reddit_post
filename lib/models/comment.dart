class Comment {
  int? id;
  String? username;
  String? text;
  String? pic;
  int? votes;
  List<Comment>? replies;

  Comment(
      {this.id, this.username, this.text, this.pic, this.votes, this.replies});
}
