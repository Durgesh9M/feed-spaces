import 'package:feed_spaces/features/feed_spaces/ui/feed_spaces_screen.dart';
import 'package:feed_spaces/features/feed_spaces/ui/feeds_page.dart';
import 'package:feed_spaces/features/feed_spaces/ui/spaces_page.dart';
import 'package:feed_spaces/features/feed_spaces/widgets/post_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed Spaces',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FeedsPage(),
    );
  }
}
