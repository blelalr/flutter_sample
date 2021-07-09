import 'package:bloc/bloc.dart';
import 'package:flutter_sample/model/post.dart';
import 'package:flutter_sample/api/api_service.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void fetchPost() async {
    try {
      if (state is PostInitial) {
        emit(PostLoading());
        final posts = await ApiService.getPosts(0);
        emit(PostSuccess(posts: posts, isReachMax: posts.isEmpty));
      } else {
        var totalPosts = List.of((state as PostSuccess).posts);
        final posts = await ApiService.getPosts(totalPosts.length);
        totalPosts.addAll(posts);
        emit(PostSuccess(posts: totalPosts, isReachMax: posts.length == 0));
      }
    } on Exception {
      emit(PostLoadFailed());
    }
  }
}
