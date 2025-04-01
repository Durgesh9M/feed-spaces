part of 'feed_spaces_bloc.dart';

@immutable
sealed class FeedSpacesState {}

final class FeedSpacesInitial extends FeedSpacesState {}

class TabSelectedIndex extends FeedSpacesState {
  final int currentIndex;

  TabSelectedIndex({required this.currentIndex});
}
