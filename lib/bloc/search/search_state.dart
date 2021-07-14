part of 'search_cubit.dart';

abstract class SearchState {
  List<User> userCache = const <User>[];
  List<Repo> repoCache = const <Repo>[];
}

class SearchInitial extends SearchState {}

class SearchMode extends SearchState {}

class DiscoverMode extends SearchState {}

class Searching extends SearchState {}

class Searched extends SearchState {}
//
// class UserSearched extends SearchState {
//   final List<User> searchResult;
//   UserSearched({this.searchResult = const <User>[]});
// }
//
// class RepoSearched extends SearchState {
//   final List<Repo> searchResult;
//   RepoSearched({this.searchResult = const <Repo>[]});
// }

class SearchFail extends SearchState {
  final String errorMessage;

  SearchFail(this.errorMessage);
}
