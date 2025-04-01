import 'package:flutter/material.dart';

class FeedSpacesScreen extends StatefulWidget {
  const FeedSpacesScreen({super.key});

  @override
  State<FeedSpacesScreen> createState() => _FeedSpacesScreenState();
}

class _FeedSpacesScreenState extends State<FeedSpacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed Spaces'),
      ),
      body: Center(
        child: Text('We are on the feed spaces screen'),
      ),
    );
  }
}
