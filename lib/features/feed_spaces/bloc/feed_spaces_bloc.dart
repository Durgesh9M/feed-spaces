import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:feed_spaces/features/feed_spaces/services/feed_service.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:flutter/material.dart';

import '../../models/comment_model.dart' as comment;

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;
  List<Record> record = [];

  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
    on<FeedsFetchedEvent>(feedsFetchedEvent);
    on<LikeButtonOnClickedEvent>(likeButtonOnClickedEvent);
    on<DisLikeButtonOnClickedEvent>(disLikeButtonOnClickedEvent);
    on<FeedsCommentFetchedEvent>(feedsCommentFetchedEvent);
    on<FeedsCommentRepliesFetchedEvent>(feedsCommentRepliesFetchedEvent);
  }

  Future<void> tabChangeEvent(
      TabChangeEvent event, Emitter<FeedSpacesState> emit) async {
    try {
      selectedTabIndex = event.index;
      emit(TabSelectedIndex(selectedTabIndex));
    } on Exception catch (e) {
      print(e);
    }
  }

  FutureOr<void> feedsFetchedEvent(
      FeedsFetchedEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final allFeeds = await FeedService.getFeeds();

      if (allFeeds == null || allFeeds.data.records.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }
      record = allFeeds.data.records;
      emit(FetchAllFeedsSuccessState());
      print("Length: ${record.length}");
    } catch (e) {
      log(e.toString());
      emit(FetchAllFeedsLoadingState());
    }

    // emit(FetchAllFeedsLoadingState());
    // var allFeeds = await FeedService.getFeeds();
    // record = allFeeds!.data.records;
    // emit(FetchAllFeedsSuccessState(feedsModel: allFeeds));
  }

  Future<void> likeButtonOnClickedEvent(
      LikeButtonOnClickedEvent event, Emitter<FeedSpacesState> emit) async {
    try {
      bool isLiked = await FeedService.feedLiked(
          {"space_id": event.spaceId}, event.postId);
      if (isLiked) {
        // Find the post index in your local records list
        final int index = record.indexWhere((post) => post.id == event.postId);
        if (index != -1) {
          // Update the like count locally
          record[index].userLikesCount = (record[index].userLikesCount) + 1;
        }
        emit(PostLikedSuccessState());
        emit(FetchAllFeedsSuccessState());
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> disLikeButtonOnClickedEvent(
      DisLikeButtonOnClickedEvent event, Emitter<FeedSpacesState> emit) async {
    try {
      bool isDisLiked = await FeedService.feedDisliked(event.postId);
      if (isDisLiked) {
        // Find the post index in your local records list
        final int index = record.indexWhere((post) => post.id == event.postId);
        if (index != -1) {
          // Update the dislike count locally
          record[index].userLikesCount = (record[index].userLikesCount) - 1;
        }
        // emit(PostLikedSuccessState());
        emit(FetchAllFeedsSuccessState());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  FutureOr<void> feedsCommentFetchedEvent(
      FeedsCommentFetchedEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final allFeedsComment = await FeedService.getFeedComments(event.postId);

      if (allFeedsComment == null || allFeedsComment.data.records.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }

      emit(FetchAllCommentsOfFeedState(commentModel: allFeedsComment));
      print("Comment Length: ${allFeedsComment.data.records.length}");
    } catch (e) {
      log(e.toString());
      emit(FetchAllFeedsLoadingState());
    }
  }

FutureOr<void> feedsCommentRepliesFetchedEvent(
      FeedsCommentRepliesFetchedEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final allFeedsCommentReplies = await FeedService.getCommentReplies(event.commentId);

      if (allFeedsCommentReplies == null || allFeedsCommentReplies.data.records.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }

      emit(FetchAllCommentsOfFeedState(commentModel: allFeedsCommentReplies));
      print("Comment Replies Length: ${allFeedsCommentReplies.data.records.length}");
    } catch (e) {
      log(e.toString());
      emit(FetchAllFeedsLoadingState());
    }
  }
}
