part of 'all_search_cubit.dart';

@immutable
abstract class AllSearchState {}

class AllSearchInitial extends AllSearchState {}

class AllSearching extends AllSearchState {}

class AllSearched extends AllSearchState {
  final List<User> allList;
  AllSearched({required this.allList});
}

class AllSearchFail extends AllSearchState {
  final String allError;

  AllSearchFail({required this.allError});
}
