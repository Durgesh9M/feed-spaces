import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  int selectedTabIndex = 0;

  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<TabChangeEvent>(tabChangeEvent);
  }

  Future<void> tabChangeEvent(
      TabChangeEvent event, Emitter<FeedSpacesState> emit) async {
    try {
      selectedTabIndex = event.index;
      emit(TabSelectedIndex());
    } on Exception catch (e) {
      print(e);
    }
  }
}
