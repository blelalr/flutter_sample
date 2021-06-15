part of 'post_cubit.dart';

@immutable
abstract class PostState{}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<Post> posts;
  final bool isReachMax;

  PostSuccess(
      {required this.posts, required this.isReachMax});
}

class PostLoadFailed extends PostState {
  PostLoadFailed();
}
