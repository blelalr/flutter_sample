import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(DiscoverMode());

  bool get isSearch {
    return !(state is DiscoverMode);
  }

  void switchToDiscoverMode() {
    emit(DiscoverMode());
  }

  void switchToSearchMode() {
    emit(SearchMode());
  }

  void searchQuery(String query) {
    // emit(Searching());
    // try {
    //   List<Photo> fakeList = getFakeResult(query);
    //   emit(Searched(searchResult: fakeList ));
    // } catch (e) {
    //   emit(SearchFail(errorMessage: e.toString()));
    // }
  }

  // List<Photo> getFakeResult(String query) {
  //   List<Photo>
  //   return
  // }
}
