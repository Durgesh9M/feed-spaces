import "dart:developer";

import "package:dio/dio.dart";
import "package:feed_spaces/features/network/api_endpoint.dart";

class ApiService {
  static final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiMTc0MzU3MDU1Njg1NjY4MTgiLCJpYXQiOjE3NDM0ODQxNTZ9.4eTKo8ojsW--DUfFQ82vFcpyoiF8LMA3LHGpN7My4PI";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApiEndpoint.baseUrl,
      connectTimeout: Duration(seconds: 15),
      receiveTimeout: Duration(seconds: 15),
      receiveDataWhenStatusError: true,
    ),
  );

  Options options = Options(
    contentType: 'application/json; charset=UTF-8',
    headers: {'Authorization': 'Bearer $token'},
  );

  Future<dynamic> getData(
      {required String url, bool isHeaderRequired = false}) async {
    if (isHeaderRequired) {}

    try {
      Response response = await _dio.get(url, options: options);
      if (response.statusCode == 200) {
        return response.data;
      }
    } on Exception catch (e) {
      log("Error: $e");
      return null;
    }
  }

  Future<dynamic> postData(
      {required String url, Map<String, dynamic>? params}) async {
    try {
      print("POST URL is : $url and PARAMS ARE : $params");
      Response response = await _dio.post(url, data: params, options: options);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }


  Future<dynamic> deleteData({required String url}) async {
try {
      print("DELETE URL is : $url");
      Response response = await _dio.delete(url, options: options);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log("Error: $e");
      return null;
    }
  }
}
