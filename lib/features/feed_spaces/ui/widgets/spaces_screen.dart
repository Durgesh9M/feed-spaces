import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SpacesScreen extends StatefulWidget {
  const SpacesScreen({super.key});

  @override
  State<SpacesScreen> createState() => _SpacesScreenState();
}

class _SpacesScreenState extends State<SpacesScreen> {
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
            Row(
              children: [
                Icon(Icons.circle, color: AppColors.blue,
                  size: 18.0,),
                TextButton(onPressed: (){},
                    child: Text("Rezolut Dummy 1" , style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, color: AppColors.blue, size: 18.0,),
                TextButton(onPressed: (){},
                    child: Text("Rezolut Dummy 2" , style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),)),
              ],
            ),
            Row(
              children: [
                Icon(Icons.circle, color: AppColors.blue, size: 18.0,),
                TextButton(onPressed: (){},
                    child: Text("Rezolut Dummy 3" , style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),)),
              ],
            ),
            SizedBox(height: 22.0,),
            Text("Tinker Village",
              style: TextStyle(fontSize: 16.0,
                  fontWeight: FontWeight.bold),),

            Row(
              children: [
                Icon(Icons.circle, color: AppColors.blue, size: 18.0,),
                TextButton(onPressed: (){},
                    child: Text("Teachers", style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
