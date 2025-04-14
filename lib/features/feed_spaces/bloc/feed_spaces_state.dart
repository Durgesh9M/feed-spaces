part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesState {}

abstract class FeedSpacesActionState extends FeedSpacesState {}

final class FeedSpacesInitial extends FeedSpacesState {}

class FetchAllFeedsLoadingState extends FeedSpacesState {}

class FetchAllFeedsSuccessState extends FeedSpacesState {
  // final AllFeedsModel? feedsModel;

  FetchAllFeedsSuccessState();
}

class FetchAllFeedsErrorState extends FeedSpacesState {
  final String message;

  FetchAllFeedsErrorState(this.message);
}

class FetchMoreDataState extends FeedSpacesState {}

class NoMoreDataState extends FeedSpacesActionState {}

class TabSelectedIndex extends FeedSpacesState {
  final int currentIndex;

  TabSelectedIndex(this.currentIndex);
}

class PostLikedSuccessState extends FeedSpacesState {}

class PostDisLikedSuccessState extends FeedSpacesState {}

class FetchAllCommentsOfFeedState extends FeedSpacesState {
  final comment.CommentModel? commentModel;

  FetchAllCommentsOfFeedState({required this.commentModel});
}

class FetchSpaceGroupNameLoading extends FeedSpacesState {}

class FetchSpaceGroupNameSuccess extends FeedSpacesState {
  final SpacesModel? spacesList;

  FetchSpaceGroupNameSuccess(this.spacesList);
}

class FetchSpaceGroupNameError extends FeedSpacesState {
  final String message;

  FetchSpaceGroupNameError(this.message);
}
