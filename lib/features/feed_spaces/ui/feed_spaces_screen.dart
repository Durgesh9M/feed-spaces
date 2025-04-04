import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/feed_spaces/ui/widgets/spaces_screen.dart';
import 'package:feed_spaces/features/source/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/feed_screen.dart';

class FeedSpacesScreen extends StatefulWidget {
  const FeedSpacesScreen({super.key});

  @override
  State<FeedSpacesScreen> createState() => _FeedSpacesScreenState();
}

class _FeedSpacesScreenState extends State<FeedSpacesScreen> {
  final FeedSpacesBloc feedSpacesBloc = FeedSpacesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(40)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.home, color: Colors.white),
            // ),

            SvgPicture.asset(
              'assets/icons/.svg',
              height: 24,
              width: 24,
              alignment: Alignment.center,
              // color: Colors.white,
              // Optional: show a placeholder while loading.
              // placeholderBuilder: (BuildContext context) =>
              //     const CircularProgressIndicator(),
            ),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.checklist_rounded, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_rounded, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu_book_rounded, color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Feed Spaces'),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
              bloc: feedSpacesBloc,
              builder: (context, state) {
                return Row(
                  children: [
                    Tab(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  feedSpacesBloc.selectedTabIndex == 0
                                      ? AppColors.black
                                      : AppColors.grey)),
                          onPressed: () {
                            feedSpacesBloc.add(TabChangeEvent(index: 0));
                          },
                          child: Text('Feed', style: TextStyle(
                            color: Colors.white
                          ),)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tab(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                feedSpacesBloc.selectedTabIndex == 1
                                    ? AppColors.black
                                    : AppColors.grey)),
                        onPressed: () {
                          feedSpacesBloc.add(TabChangeEvent(index: 1));
                        },
                        child: Text('Spaces',  style: TextStyle(
                            color: Colors.white
                        )),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<FeedSpacesBloc, FeedSpacesState>(
              bloc: feedSpacesBloc,
              builder: (context, state) {
                return Expanded(
                    child: feedSpacesBloc.selectedTabIndex == 0
                        ? FeedScreen()
                        : SpacesScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
