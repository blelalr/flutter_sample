part of 'location_search_cubit.dart';

@immutable
abstract class LocationSearchState {}

class LocationSearchInitial extends LocationSearchState {}

class LocationSearching extends LocationSearchState {}

class LocationSearched extends LocationSearchState {
  final List<Repo> locationList;
  LocationSearched(this.locationList);
}

class LocationSearchFail extends LocationSearchState {
  final String locationError;
  LocationSearchFail({required this.locationError});
}
