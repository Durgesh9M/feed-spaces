part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesEvent {}

class AllFeedsInitialFetchEvent extends FeedSpacesEvent {}

class TabChangeEvent extends FeedSpacesEvent {
  final int index;

  TabChangeEvent({required this.index});
}

class FeedsFetchedEvent extends FeedSpacesEvent {
  bool isLoadingMore;
  int page;
  int per_page;
  FeedsFetchedEvent({this.isLoadingMore = false, required this.page, required this.per_page});
}

class LikeButtonOnClickedEvent extends FeedSpacesEvent {
  final int spaceId;
  final int postId;

  LikeButtonOnClickedEvent({required this.spaceId, required this.postId});
}

class DisLikeButtonOnClickedEvent extends FeedSpacesEvent {
  final int postId;

  DisLikeButtonOnClickedEvent({required this.postId});
}

class FeedsCommentFetchedEvent extends FeedSpacesEvent {
  final int postId;

  FeedsCommentFetchedEvent({required this.postId});
}

class FeedsCommentRepliesFetchedEvent extends FeedSpacesEvent {
  final int commentId;

  FeedsCommentRepliesFetchedEvent({required this.commentId});
}

class FetchSpaceGroupNameEvent extends FeedSpacesEvent {

}

class FetchSpacesPostsEvent extends FeedSpacesEvent{
  final String slug;
  final int page;
  int per_page;
  bool isLoadingMore;
  FetchSpacesPostsEvent(this.slug, {this.page= 1, this.per_page = 10, this.isLoadingMore = false});
}
