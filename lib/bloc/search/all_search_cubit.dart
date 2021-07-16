import 'package:bloc/bloc.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:flutter_sample/model/user_data.dart';
import 'package:meta/meta.dart';

part 'all_search_state.dart';

class AllSearchCubit extends Cubit<AllSearchState> {
  AllSearchCubit() : super(AllSearchInitial());

  void searchQuery(String query) async {
    emit(AllSearching());
    try {
      var response = await ApiService.getSearchUser(query, 0);
      emit(AllSearched(allList: response.users));
    } catch (e) {
      emit(AllSearchFail(allError: e.toString()));
    }
  }

  void stopQuery() {
    if (state is AllSearched) {
      (state as AllSearched).allList.clear();
    }
  }
}
