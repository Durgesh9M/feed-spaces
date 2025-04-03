import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:feed_spaces/features/source/api_service.dart';
import 'package:flutter/material.dart';

import '../../models/spaces_model.dart';

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;
  final ApiService apiService;

  FeedSpacesBloc(this.apiService) : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
    on<FetchSpaceGroupNameEvent>(fetchSpaceGroupNameEvent);
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
      final List<SpacesModel?> response = await apiService.fetchSpaces();
      if (response.isEmpty) {
        emit(FetchSpaceGroupNameError("No spaces found."));
      } else {
        emit(FetchSpaceGroupNameSuccess(response));
      }
    } catch(e){
      debugPrint("Error: $e");
      emit(FetchSpaceGroupNameError("Error: $e"));
    }

  }
}
