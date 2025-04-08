part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesState {}

final class FeedSpacesInitial extends FeedSpacesState {}

class FetchAllFeedsLoadingState extends FeedSpacesState {}

class FetchAllFeedsSuccessState extends FeedSpacesState {
  // final AllFeedsModel? feedsModel;

  FetchAllFeedsSuccessState();
}

class FetchAllFeedsErrorState extends FeedSpacesState {}

class TabSelectedIndex extends FeedSpacesState {
  final int currentIndex;

  TabSelectedIndex(this.currentIndex);
}

class PostLikedSuccessState extends FeedSpacesState {}

class FetchAllCommentsOfFeedState extends FeedSpacesState {
  final comment.CommentModel? commentModel;

  FetchAllCommentsOfFeedState({required this.commentModel});
}
