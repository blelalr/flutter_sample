part of 'all_search_cubit.dart';

@immutable
abstract class AllSearchState extends Equatable {
  @override
  List<Object> get props => [];
}

class AllSearchInitial extends AllSearchState {}

class AllSearching extends AllSearchState {}

class AllSearchLoadMore extends AllSearchState {
  final List<User> allList;

  AllSearchLoadMore({required this.allList});

  @override
  List<Object> get props => [allList];
}

class AllSearched extends AllSearchState {
  final List<User> allList;
  final bool isReachMax;
  String query;
  int page;
  AllSearched(
      {required this.allList,
      required this.isReachMax,
      required this.query,
      required this.page});

  @override
  List<Object> get props => [allList, isReachMax, query, page];
}

class AllSearchFail extends AllSearchState {
  final String allError;

  AllSearchFail({required this.allError});
}
