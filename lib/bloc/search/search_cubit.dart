import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:flutter_sample/model/user_data.dart';
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

  void searchQuery(String query) async {
    emit(Searching());
    try {
      final user = await ApiService.getSearchUser(query, 0);
      final repo = await ApiService.getSearchRepo(query, 0);
      emit(Searched());
      state.userCache = user.users;
      state.repoCache = repo.repos;
    } catch (e) {
      print('error: ${e.toString()}');
      emit(SearchFail(e.toString()));
    }
  }
}
