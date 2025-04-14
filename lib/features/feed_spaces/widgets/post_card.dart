import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_html/flutter_html.dart';

class PostCard extends StatefulWidget {
  final String? imageUrl;
  final double radius;
  final String? author;
  final String? subtitle;
  final String? title;
  final String? content;
  final int? likesCount;
  final Icon? iconLike;
  final int? commentCount;
  final DateTime? date;
  final double? height;
  final double? width;
  final String? role;
  final GestureTapCallback? onTap;
  final Records post;
  final FeedSpacesBloc feedSpacesBloc;

  const PostCard({
    super.key,
    this.imageUrl,
    this.radius = 20,
    this.author,
    this.subtitle,
    this.title,
    this.content,
    this.likesCount,
    this.commentCount,
    this.date,
    this.height,
    this.width,
    this.role,
    this.onTap,
    this.iconLike,
    required this.post,
    required this.feedSpacesBloc,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isExpanded = false;

  // final FeedSpacesBloc feedSpacesBloc = FeedSpacesBloc();

  String getTimeAgo(DateTime date) {
    final Duration diff = DateTime.now().difference(date);
    if (diff.inSeconds < 60) {
      return '${diff.inSeconds} seconds ago';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours} hours ago';
    } else {
      return '${diff.inDays} days ago';
    }
  }

  // late bool isLiked;
  // late int likeCount;

  @override
  void initState() {
    super.initState();
    // isLiked = widget.post.isLiked ?? false; // assuming this is available
    // likeCount = widget.post.userLikesCount ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedSpacesBloc, FeedSpacesState>(
      bloc: widget.feedSpacesBloc,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return InkWell(
          splashColor: Colors.transparent,
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(20.0),
            ),
            height: widget.height,
            width: widget.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0, top: 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.imageUrl ?? ''),
                        radius: widget.radius,
                      ),
                      SizedBox(width: 6.0),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.author ?? "",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              if (widget.role != null &&
                                  widget.role!.isNotEmpty)
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    widget.role ?? "role",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                            widget.subtitle ?? "",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.grey),
                          ),
                        ],
                      ),
                      // SizedBox(width: 6.0,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.title ?? "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                if (widget.content != null)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final bool needsExpansion =
                                _needsExpandButton(widget.content!);
                            if (!needsExpansion) {
                              return HtmlWidget(
                                widget.content!,
                                onTapImage: (image) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Container(
                                      color: Colors.white,
                                      height: 100.0,
                                      child: Dialog(
                                        elevation: 1.2,
                                        // backgroundColor: Colors.black,
                                        child: InteractiveViewer(
                                          child: Image.network(
                                              image.sources.first.url),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                textStyle: const TextStyle(fontSize: 14.0),
                                customStylesBuilder: (element) {
                                  switch (element.localName) {
                                    case 'body':
                                      return {
                                        'height': '150px',
                                        'margin': '0',
                                        'padding': '0',
                                      };
                                    case 'p':
                                      return {
                                        'margin': '0',
                                        'padding': '0',
                                        'line-height': '1.4',
                                      };

                                    case 'img':
                                      return {
                                        "max-width": "100%",
                                        "height": "auto",
                                      };
                                  }
                                  return null;
                                },
                                renderMode: RenderMode.column,
                              );
                            }
                            if (_isExpanded) {
                              return HtmlWidget(
                                widget.content!,
                                onTapImage: (image) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Container(
                                      color: Colors.white,
                                      height: 100.0,
                                      child: Dialog(
                                        elevation: 1.2,
                                        // backgroundColor: Colors.black,
                                        child: InteractiveViewer(
                                          child: Image.network(
                                              image.sources.first.url),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                textStyle: const TextStyle(fontSize: 14.0),
                                customStylesBuilder: (element) {
                                  switch (element.localName) {
                                    case 'body':
                                      return {
                                        'height': '150px',
                                        'margin': '0',
                                        'padding': '0',
                                      };
                                    case 'p':
                                      return {
                                        'margin': '0',
                                        'padding': '0',
                                        'line-height': '1.4',
                                      };
                                    case 'img':
                                      return {
                                        "max-width": "100%",
                                        "height": "auto",
                                      };
                                  }
                                  return null;
                                },
                                renderMode: RenderMode.column,
                                // shrinkWrap: true,
                              );
                            } else {
                              return ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: constraints.maxWidth,
                                  maxHeight:
                                      _isExpanded ? double.infinity : 150,
                                ),
                                child: SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: HtmlWidget(
                                      widget.content!,
                                      onTapImage: (image) {
                                        showDialog(
                                          context: context,
                                          builder: (_) => Dialog(
                                            elevation: 1.2,
                                            // backgroundColor: Colors.black,
                                            child: InteractiveViewer(
                                              child: Image.network(
                                                  image.sources.first.url),
                                            ),
                                          ),
                                        );
                                      },
                                      textStyle:
                                          const TextStyle(fontSize: 14.0),
                                      customStylesBuilder: (element) {
                                        switch (element.localName) {
                                          case 'body':
                                            return {
                                              'height': '150px',
                                              'margin': '0',
                                              'padding': '0',
                                            };
                                          case 'p':
                                            return {
                                              'margin': '0',
                                              'padding': '0',
                                              'line-height': '1.4',
                                            };
                                        }
                                        return null;
                                      },
                                      renderMode: RenderMode.column,
                                      // shrinkWrap: true,
                                    )),
                              );
                            }
                          },
                        ),
                        if (_needsExpandButton(widget.content!))
                          GestureDetector(
                            onTap: () =>
                                setState(() => _isExpanded = !_isExpanded),
                            child: Text(
                              _isExpanded ? 'Show less' : 'Show more',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                const Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          _buildInteractionButton(
                            icon: widget.iconLike ??
                                Icon(
                                  Icons.favorite,
                                  color: widget.post.isLiked == true
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                            count: widget.post.userLikesCount ?? 0,
                            onPressed: () {
                              if (widget.post.isLiked == false) {
                                widget.feedSpacesBloc.add(
                                    LikeButtonOnClickedEvent(
                                        spaceId: widget.post.space!.id!,
                                        postId: widget.post.id!));
                                print(
                                    'like button clicked: ${widget.post.id}');
                              }
                              else {
                                widget.feedSpacesBloc.add(
                                    DisLikeButtonOnClickedEvent(
                                        postId: widget.post.id!));
                                print(
                                    'dislike button clicked: ${widget.post.id}');

                              }
                              // isLiked = !isLiked;
                              // print("Liked button clicked: ${widget.post.id}");
                            },
                          ),
                          const SizedBox(width: 16),
                          _buildInteractionButton(
                            icon: Icon(Icons.comment_outlined),
                            count: widget.commentCount ?? 0,
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text(
                        widget.date != null ? getTimeAgo(widget.date!) : '',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  bool _needsExpandButton(String htmlContent) {
    // Simple check for content length; adjust threshold as needed.
    return htmlContent.length > 250;
  }

  Widget _buildInteractionButton({
    required Icon icon,
    required int count,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 4),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
