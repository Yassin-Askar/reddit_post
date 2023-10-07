import 'package:flutter/material.dart';
import 'package:reddit_post/views/screens/post_screen.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: PostScreen(),
      ),
    );
  }
}
