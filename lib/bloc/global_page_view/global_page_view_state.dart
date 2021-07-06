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

  // GlobalPageViewLoaded copyWith({
  //   List<Post>? fakeLoadingList,
  // }) {
  //   return GlobalPageViewLoaded(
  //     globalList: fakeLoadingList ?? this.fakeLoadingList,
  //   );
  // }
}

class GlobalPageViewRightLoading extends GlobalPageViewState {}

class GlobalPageViewLoaded extends GlobalPageViewState {
  GlobalPageViewLoaded({
    this.globalList = const <Post>[],
  });

  final List<Post> globalList;

  // GlobalPageViewLoaded copyWith({
  //   List<Post>? globalList,
  // }) {
  //   return GlobalPageViewLoaded(
  //     globalList: globalList ?? this.globalList,
  //   );
  // }
}

class GlobalPageViewFail extends GlobalPageViewState {}
