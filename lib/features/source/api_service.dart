import 'dart:convert';
import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:feed_spaces/features/models/spaces_model.dart';
import 'package:feed_spaces/features/source/api_endpoint.dart';

class ApiService {
 final Dio _dio = Dio();

 final String _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiMTcyNDEzODQ5MjYxNjkxOTUiLCJpYXQiOjE3MjQwNTIwOTJ9.WJeufiWafm4EkfswxAhX5iunuNY2Jumoe4fdT5GS2Dw";

 Future <SpacesModel?> fetchSpaces() async {
   try {
     final response = await _dio.get(
       "${ApiEndpoint.getSpaces}",
       options: Options(
         headers: {
           "Authorization": "Bearer $_token",
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



}