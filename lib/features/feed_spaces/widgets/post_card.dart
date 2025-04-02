import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String? author;
  final String? title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subTitleStyle;
  final String? content;
  final TextStyle? contentStyle;
  final ImageProvider? imageUrl;
  final DateTime? date;
  final Widget? IconButton;
  final Widget? IconButton2;
  final Widget? Icon;
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  final int? likesCount;
  final int? commentCount;

  const PostCard(
      {super.key,
      this.title,
      this.subtitle,
      this.content,
      this.imageUrl,
      this.date,
      this.IconButton,
      this.Icon,
      this.child,
        this.height,
        this.width,
        this.radius,
        this.likesCount,
        this.commentCount,
        this.titleStyle,
        this.subTitleStyle,
        this.contentStyle,
        this.author,
        this.IconButton2});

  @override

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: EdgeInsets.all(16.0),
        height: height,
        width: width,
        child: Card(
          margin: EdgeInsets.all(16.0),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: imageUrl,
                    radius: radius,
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    children: [
                      Text(author ?? "hbchbc", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                        color: Colors.black,
                      ),),
                      Text(subtitle ?? "bsbbaj"),
                    ],
                  )
                ]
              ),
              Text(title ?? "kkncnkckcd",),
              Text(content ?? "xkxnak",
              textAlign: TextAlign.left,),
              Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),
              Row(
                children: [
                  IconButton!,
                  Text(likesCount.toString()),
                  SizedBox(width: 10.0,),
                  IconButton2!,
                  Text(commentCount.toString()),
                  SizedBox(width: 20.0,),
                  Text(date!.toString().substring(0,10)),
            ],
          ),
        ]
        ),
      ),
      ),
    );
  }
}
