import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'feed_spaces_event.dart';
part 'feed_spaces_state.dart';

class FeedSpacesBloc extends Bloc<FeedSpacesEvent, FeedSpacesState> {
  FeedSpacesBloc() : super(FeedSpacesInitial()) {
    on<FeedSpacesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
