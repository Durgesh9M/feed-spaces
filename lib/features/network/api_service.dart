import "dart:developer";

import "package:dio/dio.dart";
import "package:feed_spaces/features/models/all_feeds_model.dart";
import "package:feed_spaces/features/models/spaces_model.dart";
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
    print("Apicalling: $url");
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


  Future <SpacesModel?> fetchSpaces() async {
    try {
      final response = await _dio.get(
        "${ApiEndpoint.getSpaces}",
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      print(" Raw Response Data: ${response.data}");

      if (response.statusCode == 200) {
        log("response: ${response.data}");
        return SpacesModel.fromJson(response.data);

      }
    } catch (e) {
      print("ERROR: $e");
    }
    return null;
  }

  Future<AllFeedsModel?> getSpacesPost(String slug) async {
    try{
      final response = await getData(url: ApiEndpoint.getSpacesPosts(slug));
      // log("ApiUrl: $getSpacesPost)");
      log("Raw data1: ${response}");
      if(response == null){
        return null;
      }
      log("response3: ${response}");
      return AllFeedsModel.fromJson(response);
    } catch(e){
      print("ERROR fetching Space-feeds: $e");
      return null;
    }
  }

}
