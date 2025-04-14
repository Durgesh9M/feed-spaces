import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/feed_spaces/ui/feed_detail_screen.dart';
import 'package:feed_spaces/features/feed_spaces/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../core/utils/app_colors.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedSpacesBloc feedSpacesBloc = FeedSpacesBloc();
  final ScrollController _scrollController = ScrollController();
  int page = 1;
  // bool isLoadingMore = false;

  onEndOfPage() {
      page++;
    feedSpacesBloc.add(FeedsFetchedEvent(isLoadingMore: true, page: page, per_page: 10));

  }

  @override
  void initState() {
    feedSpacesBloc.add(FeedsFetchedEvent(page: 1, per_page: 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
        bloc: feedSpacesBloc,
        builder: (context, state) {
          if (state is FetchAllFeedsLoadingState) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is !FetchAllFeedsLoadingState) {
            final posts = feedSpacesBloc.record;
            return LazyLoadScrollView(
              onEndOfPage: (){
                if(state is !NoMoreDataState){
                  onEndOfPage();
                }

              },
              child: ListView.separated(
                controller: _scrollController,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10.0,
                  );
                },
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: feedSpacesBloc.record!.length + 1,
                itemBuilder: (context, index) {
                  if (index == posts!.length) {
                    return
                    state is FetchMoreDataState ?
                      Center(child: CircularProgressIndicator(color: Colors.blue,))
                    : state is NoMoreDataState
                      ? Text("No more data")
                    :SizedBox.shrink();
                  }
                  final feed = posts[index];
                  return PostCard(
                    onTap: () {
                      print("Tapped feed post cards");
                    },
                    imageUrl: feed.author?.avatarUrl,
                    author: feed.author?.name,
                    role: (feed.author!.roles!.isNotEmpty)
                        ? feed.author?.roles?.elementAt(0).toUpperCase()
                        : "",
                    title: feed.name,
                    subtitle: feedSpacesBloc.record?[index].space!.name,
                    content: feed.tiptapBody!.body!.data,
                    likesCount: feedSpacesBloc.record?[index].userLikesCount,
                    commentCount: feedSpacesBloc.record?[index].commentCount,
                    date: feedSpacesBloc.record?[index].createdAt,
                    post: feed,
                    feedSpacesBloc: feedSpacesBloc,
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

}
