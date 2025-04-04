import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:feed_spaces/features/feed_spaces/services/feed_service.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:flutter/material.dart';

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;
  List<Record> record = [];

  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
    on<FeedsFetchedEvent>(feedsFetchedEvent);
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
    try {
      final allFeeds = await FeedService.getFeeds();

      if (allFeeds == null || allFeeds.data.records.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }
      record = allFeeds.data.records;
      emit(FetchAllFeedsSuccessState(feedsModel: allFeeds));
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
}
