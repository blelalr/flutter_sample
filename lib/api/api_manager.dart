import 'package:dio/dio.dart';
import 'package:flutter_sample/api/api_path.dart';
import 'package:flutter_sample/page/network/post.dart';

enum DioMethod {
  get,
  post,
  put,
  delete,
}

class ApiManager {

  Dio _dio = Dio();
  static final ApiManager _apiServiceManager = ApiManager._internal();

  factory ApiManager() {
    BaseOptions options = BaseOptions(
        connectTimeout: 15*1000, // 15 seconds
        receiveTimeout: 15*1000 // 60 seconds
    );
    _apiServiceManager._dio = Dio(options);
    return _apiServiceManager;
  }

  ApiManager._internal();

  Future get({required String path, Map<String, dynamic>? params}) async {
    return await requestHttp(path, method: DioMethod.get, params: params);
  }

  Future post({required String path, Map<String, dynamic>? params}) async {
    return await requestHttp(path, method: DioMethod.post, params: params);
  }

  Future requestHttp(String path, {DioMethod method = DioMethod.get, Map<String, dynamic>? params}) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.delete: 'delete',
      DioMethod.put: 'put'
    };

    try {
      Response response;

      switch (method) {
        case DioMethod.get:
          response = await _dio.get(path, queryParameters: params , options: Options(method: methodValues[method]));
          break;
        default:
          response = await _dio.request(path, data: params, options: Options(method: methodValues[method]));
          break;
      }

      return response.data;

    } on DioError catch (e) {
      print('DioError--- ${e.type}');
      print('DioError--- ${e.message}');
      throw e;
    }
  }

}
