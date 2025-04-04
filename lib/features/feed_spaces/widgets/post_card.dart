import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostCard extends StatefulWidget {
  final String? imageUrl;
  final double radius;
  final String? author;
  final String? subtitle;
  final String? title;
  final String? content;
  final int? likesCount;
  final int? commentCount;
  final DateTime? date;
  final double? height;
  final double? width;

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
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _isExpanded = false;

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      height: widget.height,
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.imageUrl ?? ''),
              radius: widget.radius,
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
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth,
                          maxHeight: _isExpanded ? double.infinity : 150,
                        ),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Html(
                            data: widget.content!,
                            style: {
                              // Removed width property to allow the HTML to adapt to constraints.
                              "body": Style(
                                // width: Width(32.w), // Removed to fix infinite width error.
                                height: Height(150),
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
                      );
                    },
                  ),
                  if (_needsExpandButton(widget.content!))
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: Text(
                        _isExpanded ? 'Show less' : 'Show more',
                        style: const TextStyle(
                          color: Colors.blue,
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
                      icon: Icons.favorite_border,
                      count: widget.likesCount ?? 0,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _buildInteractionButton(
                      icon: Icons.comment_outlined,
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
    );
  }

  bool _needsExpandButton(String htmlContent) {
    // Simple check for content length; adjust threshold as needed.
    return htmlContent.length > 300;
  }

  Widget _buildInteractionButton({
    required IconData icon,
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
            Icon(icon, size: 20, color: Colors.grey[600]),
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
