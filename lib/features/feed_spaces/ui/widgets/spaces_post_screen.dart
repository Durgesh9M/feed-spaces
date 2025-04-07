import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/post_card.dart';

class SpacesPostScreen extends StatefulWidget {
  const SpacesPostScreen({super.key});

  @override
  State<SpacesPostScreen> createState() => _SpacesPostScreenState();
}

class _SpacesPostScreenState extends State<SpacesPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        forceMaterialTransparency: true,

      ),
      body: Container(
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(
                      height: 10.0
                  );
                },
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return PostCard(
                    imageUrl: AssetImage("assets/images/cat.jpg"),
                    radius: 30,
                    author: "Douglas Tyler",
                    subtitle: "Rezolut Dummy 1",
                    title: "Ai is new development",
                    role: "Admin",
                    content:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    Icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Icon2: Icon(Icons.comment),
                    likesCount: 10,
                    commentCount: 2,
                    date: DateTime.now(),
                    onTap: () {
                      print("PostCardTapped");
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
