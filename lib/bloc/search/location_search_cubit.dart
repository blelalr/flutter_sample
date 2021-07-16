import 'package:bloc/bloc.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:meta/meta.dart';

part 'location_search_state.dart';

class LocationSearchCubit extends Cubit<LocationSearchState> {
  LocationSearchCubit() : super(LocationSearchInitial());

  void searchQuery(String query) async {
    emit(LocationSearching());
    try {
      var response = await ApiService.getSearchRepo(query, 0);
      emit(LocationSearched(response.repos));
    } catch (e) {
      emit(LocationSearchFail(locationError: e.toString()));
    }
  }

  void stopQuery() {
    if (state is LocationSearched) {
      (state as LocationSearched).locationList.clear();
    }
  }
}
