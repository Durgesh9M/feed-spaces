part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesState {}

final class FeedSpacesInitial extends FeedSpacesState {}

class TabSelectedIndex extends FeedSpacesState {
  final int currentIndex;

  TabSelectedIndex(this.currentIndex);
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
