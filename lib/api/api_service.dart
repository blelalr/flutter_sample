import 'dart:async';

import 'package:flutter_sample/api/api_manager.dart';
import 'package:flutter_sample/api/api_const.dart';
import 'package:flutter_sample/model/photo.dart';
import 'package:flutter_sample/model/post.dart';
import 'package:flutter_sample/model/repo_data.dart';
import 'package:flutter_sample/model/user_data.dart';

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

  static Future<UserData> getSearchUser(String query, int page) async {
    var response = await ApiManager().get(
        path: ApiConst.GET_SEARCH_USERS,
        params: <String, String>{
          'q': '$query',
          'page': '$page',
          'per_page': '10'
        });
    // return Future.delayed(
    //     Duration(seconds: 10), () => UserData.fromJson(response));
    return UserData.fromJson(response);
  }

  static Future<RepoData> getSearchRepo(String query, int page) async {
    var response = await ApiManager().get(
        path: ApiConst.GET_SEARCH_REPO,
        params: <String, String>{
          'q': '$query',
          'page': '$page',
          'per_page': '10'
        });
    return RepoData.fromJson(response);
  }
}
