import 'package:dio/dio.dart';

class HttpUtil {
  static Future<Response> get(String url, Map<String, dynamic> params) async {
    Dio dio = Dio();
    Response response = await dio.get(
        url,
        queryParameters: params);
    return response;
  }

  static Future<Response> post(String url, var postBody) async {
    Dio dio = Dio();
    Response response = await dio.post(
        url,
        data: postBody);
    return response;
  }
}