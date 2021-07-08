part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalLoading extends GlobalState {}

class GlobalLoadMore extends GlobalState {
  GlobalLoadMore({
    this.fakeLoadingList = const <Post>[],
  });
  final List<Post> fakeLoadingList;
}

class GlobalLoaded extends GlobalState {
  GlobalLoaded({this.globalList = const <Post>[], this.movePosition});
  final int? movePosition;
  final List<Post> globalList;
}

class GlobalFail extends GlobalState {}
