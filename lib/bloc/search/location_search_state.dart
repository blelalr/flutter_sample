part of 'location_search_cubit.dart';

@immutable
abstract class LocationSearchState {}

class LocationSearchInitial extends LocationSearchState {}

class LocationSearching extends LocationSearchState {}

class LocationSearched extends LocationSearchState {
  final List<Repo> locationList;
  final bool isReachMax;
  final String query;
  final int page;
  LocationSearched(
      {required this.locationList,
      required this.isReachMax,
      required this.query,
      required this.page});
}

class LocationSearchFail extends LocationSearchState {
  final String locationError;
  LocationSearchFail({required this.locationError});
}
