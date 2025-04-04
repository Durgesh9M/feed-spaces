import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/feed_spaces/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final FeedSpacesBloc feedSpacesBloc = FeedSpacesBloc();

  @override
  void initState() {
    super.initState();
    feedSpacesBloc.add(FeedsFetchedEvent());
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
          if (state is FetchAllFeedsSuccessState) {
            return ListView.builder(
              shrinkWrap: true,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: feedSpacesBloc.record.length,
              itemBuilder: (context, index) {
                return PostCard(
                  imageUrl: feedSpacesBloc.record[index].author.avatarUrl,
                  author: feedSpacesBloc.record[index].author.name,
                  title: feedSpacesBloc.record[index].name,
                  subtitle: feedSpacesBloc.record[index].space.name,
                  content: feedSpacesBloc.record[index].tiptapBody.body.data,
                  likesCount: feedSpacesBloc.record[index].userLikesCount,
                  commentCount: feedSpacesBloc.record[index].commentCount,
                  date: feedSpacesBloc.record[index].createdAt,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
