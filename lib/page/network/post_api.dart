import 'package:flutter_sample/api/api_manager.dart';
import 'package:flutter_sample/api/api_path.dart';
import 'package:flutter_sample/page/network/post.dart';

class PostApi {
  static Future<List<Post>> getPosts(String startIndex) async {
    var _postLimit = 20;
    var response = await ApiManager().get(path: Api.GET_POSTS,
        params: <String, String>{
          '_start': '$startIndex',
          '_limit': '$_postLimit'
        });
    var posts = (response as List<dynamic>).map((e) => Post.fromJson(e)).toList();
    return posts;
  }
}