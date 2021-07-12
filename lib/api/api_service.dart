import 'package:flutter_sample/api/api_manager.dart';
import 'package:flutter_sample/api/api_const.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:flutter_sample/model/post.dart';

class ApiService {
  static int pageLimit = 10;
  static Future<List<Post>> getPosts(int startIndex) async {
    var response = await ApiManager().get(
        path: ApiConst.GET_POSTS,
        params: <String, String>{
          '_start': '$startIndex',
          '_limit': '$pageLimit'
        });
    var posts =
        (response as List<dynamic>).map((e) => Post.fromJson(e)).toList();
    return posts;
  }

  static Future<List<Photo>> getPhotos(int startIndex) async {
    var response = await ApiManager().get(
        path: ApiConst.GET_PHOTOS,
        params: <String, String>{'_start': '$startIndex', '_limit': '48'});
    var photos =
        (response as List<dynamic>).map((e) => Photo.fromJson(e)).toList();
    return photos;
  }
}
