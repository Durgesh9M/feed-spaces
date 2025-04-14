import 'dart:developer';

import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../widgets/post_card.dart';

class SpacesPostScreen extends StatefulWidget {
  final String? slug;

  const SpacesPostScreen({super.key, this.slug});

  @override
  State<SpacesPostScreen> createState() => _SpacesPostScreenState();
}

class _SpacesPostScreenState extends State<SpacesPostScreen> {
  final FeedSpacesBloc _feedSpacesBloc = FeedSpacesBloc();
  bool hasShownDialogueBox = false;


  int page = 1;

  onEndPage() {
    page++;
    _feedSpacesBloc.add(FetchSpacesPostsEvent(
        widget.slug!, page: page, per_page: 10, isLoadingMore: true));
  }

  @override
  void initState() {
    super.initState();
    if (widget.slug != null) {
      _feedSpacesBloc.add(
          FetchSpacesPostsEvent(widget.slug!, page: 1, per_page: 10));
    }

    // _feedSpacesBloc.add(FeedsFetchedEvent(page: 1, per_page: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
        forceMaterialTransparency: true,
      ),
      body:
      BlocConsumer<FeedSpacesBloc, FeedSpacesState>(
        bloc: _feedSpacesBloc,
        listenWhen: (current, previous) => current is FeedSpacesActionState,
        listener: (context, state) {

            if (state is NoMoreDataState) {
              if(hasShownDialogueBox == false){
                hasShownDialogueBox = true;
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("No more Data"),
                      action: SnackBarAction(label: "OK",
                          onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),));

              }

            }

    },
        buildWhen: (current, previous) => current is !FeedSpacesActionState,
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
              if (state is! FetchAllFeedsLoadingState) {
                final posts = _feedSpacesBloc.spaceRecord;
                log("response4: ${_feedSpacesBloc.record}");
                return LazyLoadScrollView(
                  onEndOfPage: () {
                    if (state is! NoMoreDataState) {
                      onEndPage();
                    }
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.0,
                      );
                    },
                    itemCount: posts!.length + 1,
                    itemBuilder: (context, index) {
                      if (index == posts.length) {
                        return
                          state is FetchMoreDataState
                              ? Center(child: CircularProgressIndicator(
                            color: Colors.blue,))
                              : SizedBox.shrink();
                              // : state is NoMoreDataState &&
                              // index == posts.length
                              // ? Center(child: Text("No more data"))
                              // : SizedBox.shrink();
                      }
                      final spacePost = posts[index];
                      return PostCard(
                        onTap: () {
                          print("Tapped Spaces Post Card");
                        },
                        imageUrl: spacePost.author?.avatarUrl,
                        author: spacePost.author?.name,
                        subtitle: spacePost.space?.name,
                        role: (spacePost.author!.roles!.isNotEmpty)
                            ? spacePost.author?.roles
                            ?.elementAt(0)
                            .toUpperCase()
                            : "",
                        title: spacePost.name,
                        content: spacePost.tiptapBody?.body?.data,
                        likesCount: spacePost.userLikesCount,
                        commentCount: spacePost.commentCount,
                        date: spacePost.createdAt,
                        post: spacePost,
                        feedSpacesBloc: _feedSpacesBloc,
                      );
                    },
                  ),
                );
              }
              return Text("No posts found.");
            },


      ),
    );
  }
}
