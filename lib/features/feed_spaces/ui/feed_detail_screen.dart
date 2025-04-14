import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class FeedDetailScreen extends StatefulWidget {
  const FeedDetailScreen(
      {super.key,
      this.imageUrl,
      this.author,
      this.subtitle,
      this.title,
      this.content,
      this.likesCount,
      this.iconLike,
      this.commentCount,
      this.date,
      this.height,
      this.width,
      this.onTap,
      required this.postId});
  final String? imageUrl;
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
  final VoidCallback? onTap;
  final int postId;

  @override
  State<FeedDetailScreen> createState() => _FeedDetailScreenState();
}

class _FeedDetailScreenState extends State<FeedDetailScreen> {
  final FeedSpacesBloc feedSpacesBloc = FeedSpacesBloc();

  @override
  void initState() {
    super.initState();
    feedSpacesBloc.add(FeedsCommentFetchedEvent(postId: widget.postId));
    // feedSpacesBloc.add(FeedsCommentRepliesFetchedEvent(commentId: ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: widget.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(widget.imageUrl ?? ''),
                  radius: 20,
                ),
                title: Text(
                  widget.author ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                subtitle: widget.subtitle != null
                    ? Text(
                        widget.subtitle!,
                        style: const TextStyle(fontSize: 12.0),
                      )
                    : null,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title ?? "Title",
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
                          return Html(
                            data: widget.content!,
                            style: {
                              "body": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                fontSize: FontSize(14.0),
                              ),
                              "p": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                lineHeight: LineHeight(1.4),
                              ),
                            },
                            shrinkWrap: true,
                          );
                        },
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
                          icon: widget.iconLike ?? Icon(Icons.favorite_border),
                          count: widget.likesCount ?? 0,
                          onPressed: widget.onTap,
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
              ),
              BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
                bloc: feedSpacesBloc,
                builder: (context, state) {
                  if (state is FetchAllCommentsOfFeedState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4.h,
                          ),
                          Text("Comments"),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.commentModel!.data.records.length,
                            itemBuilder: (context, index) {
                              return ParentComment(
                                avatarUrl: state.commentModel!.data
                                    .records[index].author.avatarUrl,
                                name: state.commentModel!.data.records[index]
                                    .author.name,
                                userRole: state.commentModel!.data
                                    .records[index].author.roles[0],
                                timeAgo: state.commentModel!.data.records[index]
                                    .createdAt,
                                content: state.commentModel!.data.records[index]
                                    .tiptapBody.body.data,
                                likesCount: state.commentModel!.data
                                    .records[index].userLikesCount,
                                replyCount: state.commentModel!.data
                                    .records[index].repliesCount,
                                replies: [
                                  ReplyComment(
                                    avatarUrl:
                                        'https://images.unsplash.com/photo-1570158268183-d296b2892211?w=100',
                                    name: 'Emily Rogers',
                                    timeAgo: '10 mins ago',
                                    content:
                                        'I agree! AI is truly a game-changer! In healthcare alone, AI-driven diagnostics can save lives by detecting diseases early. I can’t wait to see how it evolves in the next decade.',
                                    likesCount: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          // Another sibling comment: David Kim
                          ParentComment(
                            avatarUrl:
                                'https://images.unsplash.com/photo-1570158268183-d296b2892211?w=100',
                            name: 'David Kim',
                            userRole: 'Admin',
                            timeAgo:
                                state.commentModel!.data.records[0].createdAt,
                            content:
                                'The biggest challenge is AI ethics. There are lots of privacy concerns around medical data. Still excited for the future though!',
                            likesCount: 8,
                            replyCount: 0,
                            replies: const [],
                          ),
                          ParentComment(
                            avatarUrl: state
                                .commentModel!.data.records[0].author.avatarUrl,
                            name:
                                state.commentModel!.data.records[0].author.name,
                            userRole: state
                                .commentModel!.data.records[0].author.roles[0],
                            timeAgo:
                                state.commentModel!.data.records[0].createdAt,
                            content: state.commentModel!.data.records[0]
                                .tiptapBody.body.data,
                            likesCount: state
                                .commentModel!.data.records[0].userLikesCount,
                            replyCount: state
                                .commentModel!.data.records[0].repliesCount,
                            replies: [
                              ReplyComment(
                                avatarUrl:
                                    'https://images.unsplash.com/photo-1570158268183-d296b2892211?w=100',
                                name: 'Emily Rogers',
                                timeAgo: '10 mins ago',
                                content:
                                    'I agree! AI is truly a game-changer! In healthcare alone, AI-driven diagnostics can save lives by detecting diseases early. I can’t wait to see how it evolves in the next decade.',
                                likesCount: 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('No comments for this feed'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildInteractionButton({
    required Icon icon,
    required int count,
    required VoidCallback? onPressed,
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

/// A widget representing a parent comment with optional replies.
class ParentComment extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String userRole;
  final DateTime timeAgo;
  final String content;
  final int likesCount;
  final int replyCount;
  final List<ReplyComment> replies;

  const ParentComment({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.userRole,
    required this.timeAgo,
    required this.content,
    required this.likesCount,
    required this.replyCount,
    required this.replies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row: avatar, name + userRole, time
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + userRole
                  Row(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      if (userRole.isNotEmpty) ...[
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            userRole,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  // Time
                  Text(
                    getTimeAgo(timeAgo),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Content text
        Padding(
          padding: const EdgeInsets.only(left: 52),
          child: Html(
            data: content,
            style: {
              "body": Style(
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                fontSize: FontSize(14.0),
              ),
              "p": Style(
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                lineHeight: LineHeight(1.4),
              ),
            },
            shrinkWrap: true,
          ),
        ),
        const SizedBox(height: 8),
        // Interaction row (like & comment icons)
        Padding(
          padding: const EdgeInsets.only(left: 52.0),
          child: Row(
            children: [
              // Like icon
              Row(
                children: [
                  const Icon(Icons.favorite_border, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    likesCount.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Comment icon
              Row(
                children: [
                  const Icon(Icons.mode_comment_outlined, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    replyCount.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),

        if (replies.isNotEmpty) ...[
          const SizedBox(height: 8),
          for (var reply in replies) reply,
        ],
      ],
    );
  }

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
}

/// A widget representing a reply to a parent comment.
class ReplyComment extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String timeAgo;
  final String content;
  final int likesCount;

  const ReplyComment({
    super.key,
    required this.avatarUrl,
    required this.name,
    required this.timeAgo,
    required this.content,
    required this.likesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 52, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reply header: avatar, name, time
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeAgo,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Reply content
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
          ),
          const SizedBox(height: 6),
          // Like row for reply
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                const Icon(Icons.favorite_border, size: 14),
                const SizedBox(width: 4),
                Text(
                  likesCount.toString(),
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
