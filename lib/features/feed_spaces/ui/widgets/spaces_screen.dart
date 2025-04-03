import 'dart:convert';

import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:feed_spaces/features/models/spaces_model.dart';
import 'package:feed_spaces/features/source/api_service.dart';
import 'package:flutter/material.dart';

class SpacesScreen extends StatefulWidget {
  const SpacesScreen({super.key});

  @override
  State<SpacesScreen> createState() => _SpacesScreenState();
}

class _SpacesScreenState extends State<SpacesScreen> {
  final ApiService _apiService = ApiService();
  List<SpacesModel> spacesList = [];




   @override
  void initState() {
  fetchSpaces();
  }
  void fetchSpaces() async {
     final List<SpacesModel> fetchSpaceList = await _apiService.fetchSpaces();

    setState((){
     spacesList = fetchSpaceList;
    });
     print("Spaces List: ${jsonEncode(spacesList)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feeds and Spaces",
          style: TextStyle(fontSize: 16.0,
              fontWeight: FontWeight.bold),),
      ),
      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rezolut",
              style: TextStyle(fontSize: 22.0,
                  fontWeight: FontWeight.bold),),
            GestureDetector(
              onTap: (){
                print("Tapped");
              },
              child: ListTile(
                leading: Icon(Icons.circle, color: AppColors.blue,
                  size: 18.0,),
                title: Text("Rezolut Dummy 1" , style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),)
              ),
            ),
            GestureDetector(
              onTap: (){
                print("Tapped");
              },
              child: ListTile(
                  leading: Icon(Icons.circle, color: AppColors.blue,
                    size: 18.0,),
                  title: Text("Rezolut Dummy 1" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),)
              ),
            ),
            GestureDetector(
              onTap: (){
                print("Tapped");
              },
              child: ListTile(
                  leading: Icon(Icons.circle, color: AppColors.blue,
                    size: 18.0,),
                  title: Text("Rezolut Dummy 1" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),)
              ),
            ),
            // SizedBox(height: 22.0,),
            Text("Tinker Village",
              style: TextStyle(fontSize: 16.0,
                  fontWeight: FontWeight.bold),),

            GestureDetector(
              onTap: (){
                print("Tapped5");
              },
              child: ListTile(
                  leading: Icon(Icons.circle, color: AppColors.blue,
                    size: 18.0,),
                  title: Text("Tinker Village" , style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
