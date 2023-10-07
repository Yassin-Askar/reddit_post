import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reddit_post/state/comment_provider.dart';
import 'package:reddit_post/views/layout/layout.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CommentsProvider>(
            create: (context) => CommentsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Arimo",
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      ),
      home: const Layout(),
    );
  }
}
