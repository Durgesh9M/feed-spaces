part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesState {}

final class FeedSpacesInitial extends FeedSpacesState {}

class FetchAllFeedsLoadingState extends FeedSpacesState {}

class FetchAllFeedsSuccessState extends FeedSpacesState {
  final AllFeedsModel? feedsModel;

  FetchAllFeedsSuccessState({required this.feedsModel});
}

class FetchAllFeedsErrorState extends FeedSpacesState {}

class TabSelectedIndex extends FeedSpacesState {
  final int currentIndex;

  TabSelectedIndex(this.currentIndex);
}
