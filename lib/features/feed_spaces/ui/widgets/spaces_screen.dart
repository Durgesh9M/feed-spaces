import 'dart:convert';
import 'dart:developer';

import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/models/spaces_model.dart';
import 'package:feed_spaces/features/source/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpacesScreen extends StatefulWidget {
  const SpacesScreen({super.key});

  @override
  State<SpacesScreen> createState() => _SpacesScreenState();
}

class _SpacesScreenState extends State<SpacesScreen> {
  final FeedSpacesBloc _feedSpacesBloc = FeedSpacesBloc();



  @override
  void initState() {
    super.initState();

    fetchSpaces();
  }

  void fetchSpaces() async {
    _feedSpacesBloc.add(FetchSpaceGroupNameEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Feeds and Spaces",
      //     style: TextStyle(fontSize: 16.0,
      //         fontWeight: FontWeight.bold),),
      // ),
      body: Container(
        // color: Colors.red,
        padding: EdgeInsets.all(16.0),
        child: BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
          bloc: _feedSpacesBloc,
          builder: (context, state) {
            if (state is FetchSpaceGroupNameLoading) {
              return Center(child: CircularProgressIndicator());
            }
             if(state is FetchSpaceGroupNameError){
               return Center(child: Text(state.message),);
             }
             if (state is FetchSpaceGroupNameSuccess) {
               log("response2: ${state.spacesList!.data!.length}");
               return ListView.builder(
                   itemCount:  state.spacesList!.data!.length,
                   itemBuilder: (context, index) {
                     return Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text( state.spacesList!.data![index].spaceGroupName!,
                           style: TextStyle(fontSize: 22.0,
                               fontWeight: FontWeight.bold),),
                         ListView.builder(
                           shrinkWrap: true,
                           physics: NeverScrollableScrollPhysics(),
                           itemCount: state.spacesList!.data?[index].spaceGroupData!.length,
                           itemBuilder: (context, ind) {
                             return GestureDetector(
                               onTap: () {
                                 print("Tapped");
                               },
                               child: ListTile(
                                   leading: Icon(
                                     Icons.circle, color: AppColors.blue,
                                     size: 18.0,),
                                   title: Text(state.spacesList!.data?[index].spaceGroupData![ind].name ?? "", style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 16.0,
                                   ),)
                               ),
                             );
                           },

                         ),
                         // GestureDetector(
                         //   onTap: (){
                         //     print("Tapped");
                         //   },
                         //   child: ListTile(
                         //       leading: Icon(Icons.circle, color: AppColors.blue,
                         //         size: 18.0,),
                         //       title: Text("Rezolut Dummy 1" , style: TextStyle(
                         //         color: Colors.black,
                         //         fontSize: 16.0,
                         //       ),)
                         //   ),
                         // ),
                         // GestureDetector(
                         //   onTap: (){
                         //     print("Tapped");
                         //   },
                         //   child: ListTile(
                         //       leading: Icon(Icons.circle, color: AppColors.blue,
                         //         size: 18.0,),
                         //       title: Text("Rezolut Dummy 1" , style: TextStyle(
                         //         color: Colors.black,
                         //         fontSize: 16.0,
                         //       ),)
                         //   ),
                         // ),
                         // // SizedBox(height: 22.0,),
                         // Text("Tinker Village",
                         //   style: TextStyle(fontSize: 16.0,
                         //       fontWeight: FontWeight.bold),),
                         //
                         // GestureDetector(
                         //   onTap: (){
                         //     print("Tapped5");
                         //   },
                         //   child: ListTile(
                         //       leading: Icon(Icons.circle, color: AppColors.blue,
                         //         size: 18.0,),
                         //       title: Text("Tinker Village" , style: TextStyle(
                         //         color: Colors.black,
                         //         fontSize: 16.0,
                         //       ),)
                         //   ),
                         // ),
                       ],
                     );
                   }

               );
             }
            return Text("No data found");
          },
        ),
      ),
    );
  }
}
