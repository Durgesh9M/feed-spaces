import 'package:feed_spaces/features/feed_spaces/widgets/post_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            PostCard(
              imageUrl: AssetImage("assets/images/cat.jpg"),
              radius: 25,
              author: "Douglas Tyler",
              subtitle: "Rezolut Dummy 1",
              title: "Ai is new development",
              content: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              Icon: Icon(Icons.favorite, color: Colors.red,),
              Icon2: Icon(Icons.comment),
              likesCount: 10,
              commentCount: 2,
              date: DateTime.now(),
            )

          ],
        ),
      ),
    );
  }
}
