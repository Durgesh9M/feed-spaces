import 'dart:async';

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:feed_spaces/features/feed_spaces/services/feed_service.dart';
import 'package:feed_spaces/features/models/all_feeds_model.dart';
import 'package:feed_spaces/features/network/api_service.dart';
import 'package:flutter/material.dart';

import '../../models/spaces_model.dart';

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;
  List<Records>? record = [];


  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
    on<FetchSpaceGroupNameEvent>(fetchSpaceGroupNameEvent);
    on<FeedsFetchedEvent>(feedsFetchedEvent);
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
      FetchSpaceGroupNameEvent event, Emitter<FeedSpacesState> emit) async{
    emit(FetchSpaceGroupNameLoading());
    try{
      final SpacesModel? response = await ApiService().fetchSpaces();
      if (response == null) {
        emit(FetchSpaceGroupNameError("No spaces found."));
      } else {
        emit(FetchSpaceGroupNameSuccess(response));
      }
    } catch(e){
      debugPrint("Error: $e");
      emit(FetchSpaceGroupNameError("Error: $e"));
    }

  }

  FutureOr<void> feedsFetchedEvent(
      FeedsFetchedEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try {
      final allFeeds = await FeedService.getFeeds();

      if (allFeeds == null || allFeeds.data!.records!.isEmpty) {
        emit(FetchAllFeedsLoadingState());
        return;
      }
      record = allFeeds.data!.records;
      emit(FetchAllFeedsSuccessState(feedsModel: allFeeds));
      print("Length: ${record!.length}");
    } catch (e) {
      log(e.toString());
      emit(FetchAllFeedsLoadingState());
    }

    // emit(FetchAllFeedsLoadingState());
    // var allFeeds = await FeedService.getFeeds();
    // record = allFeeds!.data.records;
    // emit(FetchAllFeedsSuccessState(feedsModel: allFeeds));
  }

  FutureOr<void> fetchSpacesPostsEvent(
      FetchSpacesPostsEvent event, Emitter<FeedSpacesState> emit) async {
    emit(FetchAllFeedsLoadingState());
    try{
      final spacesPost = await ApiService().getSpacesPost(event.slug);
      if(spacesPost == null || spacesPost.data!.records!.isEmpty){
        emit(FetchAllFeedsErrorState("No Post for this space"));
        return;
      }
      // record = spacesPost.data.records;
      emit(FetchAllFeedsSuccessState(feedsModel: spacesPost));
      print("SpacePostLength: ${spacesPost.data!.records!.length}");


    } catch(e){
      emit(FetchAllFeedsErrorState("Error2: $e"));
    }

  }
}
