import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:feed_spaces/features/feed_spaces/services/feed_service.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:feed_spaces/features/network/api_service.dart';
import 'package:flutter/material.dart';

import '../../models/comment_model.dart' as comment;

import '../../models/spaces_model.dart';

part 'feed_spaces_event.dart';

part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;
  List<Records> record = [];
  List<Records> spaceRecord = [];
  int currentPage = 1;
  bool isFetching = false;
  bool isNoMoreData = false;

  // bool hasShownNoMoreData = false;

  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
    on<FetchSpaceGroupNameEvent>(fetchSpaceGroupNameEvent);
    on<FeedsFetchedEvent>(feedsFetchedEvent);
    on<LikeButtonOnClickedEvent>(likeButtonOnClickedEvent);
    on<DisLikeButtonOnClickedEvent>(disLikeButtonOnClickedEvent);
    on<FeedsCommentFetchedEvent>(feedsCommentFetchedEvent);
    on<FeedsCommentRepliesFetchedEvent>(feedsCommentRepliesFetchedEvent);
    on<FetchSpacesPostsEvent>(fetchSpacesPostsEvent);
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

  FutureOr<void> fetchSpaceGroupNameEvent(
      FetchSpaceGroupNameEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final SpacesModel? response = await ApiService().fetchSpaces();
      if (response == null) {
        emit(FetchSpaceGroupNameError("No spaces found."));
      } else {
        emit(FetchSpaceGroupNameSuccess(response));
      }
    } catch (e) {
      debugPrint("Error: $e");
      emit(FetchSpaceGroupNameError("Error: $e"));
    }
  }

  FutureOr<void> feedsFetchedEvent(
      FeedsFetchedEvent event, Emitter<FeedSpacesState> emit) async {
    if (event.isLoadingMore == true) {
      emit(FetchMoreDataState());
    } else if (isNoMoreData == true) {
      emit(NoMoreDataState());
    } else {
      emit(FetchAllFeedsLoadingState());
    }

    try {
      log("page : ${event.page}");
      final allFeeds = await FeedService.getFeeds(event.page, event.per_page);
      isNoMoreData = allFeeds?.data?.hasNextPage ?? false;

      if (allFeeds == null || allFeeds.data!.records!.isEmpty) {
        emit(NoMoreDataState());
        log("check state: ${this.state}");
        return;
      } else if (!isNoMoreData) {
        emit(FetchMoreDataState());
      }
      record!.addAll(allFeeds.data!.records!);
      emit(FetchAllFeedsSuccessState());
      log("Length: ${record.map((post) => post.id)}");
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
      final index = record!
          .indexWhere((post) => post.id?.toString() == event.postId.toString());

      final spaceIndex = spaceRecord.indexWhere(
          (spacePost) => spacePost.id?.toString() == event.postId.toString());
      if (index != -1) {
        print("Abccabc");
        // return;

        record[index].userLikesCount = (record[index].userLikesCount ?? 0) + 1;
        record[index].isLiked = true;
      } else {
        spaceRecord[spaceIndex].userLikesCount =
            (spaceRecord[spaceIndex].userLikesCount ?? 0) + 1;
        spaceRecord[spaceIndex].isLiked = true;
      }
      emit(PostLikedSuccessState());
      await FeedService.feedLiked({"space_id": event.spaceId}, event.postId);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  Future<void> disLikeButtonOnClickedEvent(
      DisLikeButtonOnClickedEvent event, Emitter<FeedSpacesState> emit) async {
    try {
      final int spaceIndex =
          spaceRecord.indexWhere((post) => post.id == event.postId);
      final int index = record.indexWhere((post) => post.id == event.postId);
      if (index != -1) {
        record[index].userLikesCount = (record[index].userLikesCount)! - 1;
        record[index].isLiked = false;
      } else {
        spaceRecord[spaceIndex].userLikesCount =
            (spaceRecord[spaceIndex].userLikesCount)! - 1;
        spaceRecord[spaceIndex].isLiked = false;
      }
      emit(PostDisLikedSuccessState());
      await FeedService.feedDisliked(event.postId);
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
      FeedsCommentRepliesFetchedEvent event,
      Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final allFeedsCommentReplies =
          await FeedService.getCommentReplies(event.commentId);

      if (allFeedsCommentReplies == null ||
          allFeedsCommentReplies.data.records.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }

      emit(FetchAllCommentsOfFeedState(commentModel: allFeedsCommentReplies));
      print(
          "Comment Replies Length: ${allFeedsCommentReplies.data.records.length}");
    } catch (e) {
      log(e.toString());
      emit(FetchAllFeedsLoadingState());
    }
  }

  FutureOr<void> fetchSpacesPostsEvent(
      FetchSpacesPostsEvent event, Emitter<FeedSpacesState> emit) async {
    if (event.isLoadingMore) {
      emit(FetchMoreDataState());
    } else if (isNoMoreData) {
      // emit(NoMoreDataState());
    } else {
      emit(FetchAllFeedsLoadingState());
    }

    try {
      final spacesPost = await ApiService()
          .getSpacesPost(event.slug, event.page, event.per_page);
      isNoMoreData = spacesPost?.data?.hasNextPage ?? false;
      if (spacesPost == null || spacesPost.data!.records!.isEmpty) {
        emit(NoMoreDataState());
        return;
      } else if (!isNoMoreData) {
        emit(FetchMoreDataState());
      }
      spaceRecord.addAll(spacesPost.data!.records!);
      emit(FetchAllFeedsSuccessState());
      // print("SpacePostLength: ${spacesPost.data!.records!.length}");
    } catch (e) {
      emit(FetchAllFeedsErrorState("Error2: $e"));
    }
  }
}
