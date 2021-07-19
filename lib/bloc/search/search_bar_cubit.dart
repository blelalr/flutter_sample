import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(DiscoverMode());

  bool get isSearchMode {
    return !(state is DiscoverMode);
  }

  void switchToDiscoverMode() {
    emit(DiscoverMode());
  }

  void switchToSearchMode() {
    emit(SearchMode());
  }
}
