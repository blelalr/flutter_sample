part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchMode extends SearchState {}

class DiscoverMode extends SearchState {}

class Searching extends SearchState {}

class Searched extends SearchState {
  final List<User> searchResult;
  Searched({this.searchResult = const <User>[]});
}

class SearchFail extends SearchState {
  final String errorMessage;

  SearchFail(this.errorMessage);
}
