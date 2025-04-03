import 'package:expandable_text/expandable_text.dart';
import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final Widget? Icon;
  final Widget? Icon2;
  final Widget? child;
  final double? height;
  final double? width;
  final double? radius;
  final int? likesCount;
  final int? commentCount;
  final String? role;

  const PostCard(
      {super.key,
      this.title,
      this.subtitle,
      this.content,
      this.imageUrl,
      this.date,
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
        this.Icon2,
        this.role,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(20.0),
            // border: Border.all(color: Colors.black)
          ),
          // padding: EdgeInsets.all(16.0),
          height: height,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: imageUrl,
                      radius: radius,
                    ),
                    SizedBox(width: 3.0),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          author!,
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontSize: 14.0),
                        ),
                        Text(
                          subtitle!,
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(width: 4.0,),
                    if (role != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          role!,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:               Text(title ?? "", style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16.0),),
                ),
              ),
              if (content != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpandableText(
                    content!,
                    style: TextStyle(fontSize: 14.0),
                    expandText: "\nShow more",
                    expandOnTextTap: true,
                    collapseText: "\nShow less",
                    maxLines: 5,
                    linkColor: Colors.black,
                    linkStyle: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Icon,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        // IconButton!,
                        Text(likesCount!.toString()),
                        SizedBox(
                          width: 12.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon2,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(commentCount!.toString()),
                      ],
                    ),
                    Text(date.toString().substring(0, 10)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
