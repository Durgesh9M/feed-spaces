import 'dart:developer';

import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/post_card.dart';

class SpacesPostScreen extends StatefulWidget {
  final String? slug;

  const SpacesPostScreen({super.key, this.slug});

  @override
  State<SpacesPostScreen> createState() => _SpacesPostScreenState();
}

class _SpacesPostScreenState extends State<SpacesPostScreen> {
  final FeedSpacesBloc _feedSpacesBloc = FeedSpacesBloc();

  @override
  void initState() {
    super.initState();
    if (widget.slug != null) {
      _feedSpacesBloc.add(FetchSpacesPostsEvent(widget.slug!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        forceMaterialTransparency: true,
      ),
      body: Container(
        child: BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
          bloc: _feedSpacesBloc,
          builder: (context, state) {
            if (state is FetchAllFeedsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FetchAllFeedsErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is FetchAllFeedsSuccessState) {
              final posts = state.feedsModel?.data?.records;
              log("response4: ${_feedSpacesBloc.record}");
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: posts!.length,
                itemBuilder: (context, index) {
                  final spacePost = posts[index] ;
                  return PostCard(
                    onTap: (){
                      print("Tapped Spaces Post Card");
                    },
                    imageUrl: spacePost.author?.avatarUrl,
                    author: spacePost.author?.name,
                    subtitle: spacePost.space?.name,
                    role: (spacePost.author!.roles!.isNotEmpty)
                      ? spacePost.author?.roles?.elementAt(0).toUpperCase()
                    : "",
                    title: spacePost.name,
                    content: spacePost.tiptapBody?.body?.data,
                    likesCount: spacePost.userLikesCount,
                    commentCount: spacePost.commentCount,
                    date: spacePost.createdAt,
                  );
                },
              );
            }
            return Text("No posts found.");
          },
        ),
      ),
    );
  }
}
