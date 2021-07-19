import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:flutter_sample/model/user_data.dart';
import 'package:meta/meta.dart';

part 'all_search_state.dart';

class AllSearchCubit extends Cubit<AllSearchState> {
  AllSearchCubit() : super(AllSearchInitial());

  void searchQuery(String query) async {
    try {
      emit(AllSearching());
      var response = await ApiService.getSearchUser(query, 1);
      emit(AllSearched(
          allList: response.users,
          isReachMax: response.users.isEmpty || (response.users.length == 0),
          query: query,
          page: 1));
    } catch (e) {
      emit(AllSearchFail(allError: e.toString()));
    }
  }

  void loadMore() async {
    try {
      if (state is AllSearched) {
        List<User> all = List.of((state as AllSearched).allList);
        String query = (state as AllSearched).query;
        int page = (state as AllSearched).page + 1;
        emit(AllSearchLoadMore(allList: all));
        final response = await ApiService.getSearchUser(query, page);
        all.addAll(response.users);
        emit(AllSearched(
            allList: all,
            isReachMax: response.users.isEmpty || (response.users.length == 0),
            query: query,
            page: page));
      }
    } catch (e) {
      emit(AllSearchFail(allError: e.toString()));
    }
  }

  void stopQuery() {
    if (state is AllSearched) {
      (state as AllSearched).allList.clear();
      (state as AllSearched).page = 0;
      (state as AllSearched).query = '';
      emit(AllSearchInitial());
    }
  }
}
