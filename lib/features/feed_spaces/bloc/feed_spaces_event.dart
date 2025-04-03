part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesEvent {}

class TabChangeEvent extends FeedSpacesEvent {
  final int index;

  TabChangeEvent({required this.index});

}

class FetchSpaceGroupNameEvent extends FeedSpacesEvent {

}
