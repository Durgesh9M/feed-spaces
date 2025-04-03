import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:feed_spaces/features/models/spaces_model.dart';
import 'package:feed_spaces/features/source/api_endpoint.dart';

class ApiService {
 final Dio _dio = Dio();

 final String _token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uX2lkIjoiMTcyNDEzODQ5MjYxNjkxOTUiLCJpYXQiOjE3MjQwNTIwOTJ9.WJeufiWafm4EkfswxAhX5iunuNY2Jumoe4fdT5GS2Dw";

 // Future<List<SpacesModel>> fetchSpaces() async {
 //   try {
 //     final response = await _dio.get("${ApiEndpoint.baseUrl}${ApiEndpoint.spaces}",
 //         options: Options(
 //         headers: {
 //           "Authorization": "Bearer $_token",
 //            "Content-Type": "application/json",
 //         }
 //     )
 //     );
 //     if(response.statusCode == 200){
 //       List<dynamic> data = response.data["data"]; // Get raw list of JSON objects
 //
 //       List<SpacesModel> spacesList = data.map((json) => SpacesModel.fromJson(json)).toList(); // Convert to SpacesModel
 //
 //       return spacesList;
 //
 //     }
 //
 //     // print("Response Data: ${response.data}");
 //     // return response.data;
 //     // return List<SpacesModel>.from(response.data.map((x) => SpacesModel.fromJson(x)));
 //   } catch (e){
 //     print("ERROR : $e");
 //   }
 //   return [];
 // }

 Future<List<SpacesModel>> fetchSpaces() async {
   try {
     final response = await _dio.get(
       "${ApiEndpoint.baseUrl}${ApiEndpoint.spaces}",
       options: Options(
         headers: {
           "Authorization": "Bearer $_token",
           "Content-Type": "application/json",
         },
       ),
     );
     print(" Raw Response Data: ${response.data}");

     if (response.statusCode == 200) {
       // Extract the "data" array
       final List<dynamic> responseData = response.data;

       // Convert each JSON object to a SpacesModel instance
       List<SpacesModel> spacesList =
       responseData.map((json) => SpacesModel.fromJson(json)).toList();

       print("Fetched Spaces: ${jsonEncode(spacesList)}"); // Prints readable JSON

       return spacesList;
     }
   } catch (e) {
     print("ERROR: $e");
   }
   return [];
 }

}