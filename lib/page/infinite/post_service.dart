import 'package:flutter_sample/api/api_manager.dart';
import 'package:flutter_sample/api/api_path.dart';
import 'package:flutter_sample/page/infinite/post.dart';

class PostService {
  static Future<List<Post>> getPosts(int startIndex) async {
    var _postLimit = 10;
    var response = await ApiManager().get(
        path: Api.GET_POSTS,
        params: <String, String>{
          '_start': '$startIndex',
          '_limit': '$_postLimit'
        });
    var posts =
        (response as List<dynamic>).map((e) => Post.fromJson(e)).toList();
    return posts;
  }
}
