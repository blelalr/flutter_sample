part of 'global_page_view_cubit.dart';

@immutable
abstract class GlobalPageViewState {}

class GlobalPageViewInitial extends GlobalPageViewState {}

class GlobalPageViewLoading extends GlobalPageViewState {}

class GlobalPageViewLoadMore extends GlobalPageViewState {
  GlobalPageViewLoadMore({
    this.fakeLoadingList = const <Post>[],
  });
  final List<Post> fakeLoadingList;
}

class GlobalPageViewLoaded extends GlobalPageViewState {
  GlobalPageViewLoaded({this.globalList = const <Post>[], this.movePosition});
  final int? movePosition;
  final List<Post> globalList;
}

class GlobalPageViewFail extends GlobalPageViewState {}
