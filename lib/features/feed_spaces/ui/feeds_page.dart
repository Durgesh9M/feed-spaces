import 'package:feed_spaces/features/feed_spaces/widgets/post_card.dart';
import 'package:flutter/material.dart';

class FeedsPage extends StatefulWidget {
  const FeedsPage({super.key});

  @override
  State<FeedsPage> createState() => _FeedsPageState();
}

class _FeedsPageState extends State<FeedsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeds and Spaces",
        style: TextStyle(fontSize: 16.0,
        fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Column(
          children: [
            PostCard(
              height: 290,
              width: 350,
              imageUrl: AssetImage("assets/images/cat.jpg"),
              radius: 25,
              author: "ahbbac",
              titleStyle: TextStyle(
                color: Colors.pink,
                fontSize: 20.0,
              ),
              title: "Ai is new Development",
              content: "shasjhdahchjcsdsjssjhhskhhfhfhfhwhf\n sjbcajbcabjbcchcjjwgjjwwjejdkwvkw \n scjabjba ba bab jbjjbsj jwKJFHwfJFIjfwjfwjfacads\n habscbhcbbbd chchWLQJLQJLQJFLJALJ\n",
              IconButton: IconButton(onPressed: (){},
                  icon: Icon(Icons.favorite)),
              likesCount: 10,
              IconButton2: IconButton(onPressed: (){},
                  icon: Icon(Icons.comment)),
              commentCount: 2,
              date: DateTime.now(),
            )

          ],
        ),
      ),
    );
  }
}
