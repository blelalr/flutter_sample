part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchMode extends SearchState {}

class DiscoverMode extends SearchState {}

class Searching extends SearchState {}

class Searched extends SearchState {}

class SearchFail extends SearchState {}
