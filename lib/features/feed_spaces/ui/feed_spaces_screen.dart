import 'package:feed_spaces/core/utils/app_colors.dart';
import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/feed_spaces/ui/widgets/spaces_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        margin: EdgeInsets.only(bottom: 15.0),
        width: 250,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(24)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.home, color: Colors.white),
            // ),

            SvgPicture.asset(
              'assets/icons/home.svg',
              height: 28,
              width: 28,
              color: Colors.white,
              // color: Colors.white,
              // Optional: show a placeholder while loading.
              // placeholderBuilder: (BuildContext context) =>
              //     const CircularProgressIndicator(),
            ),

            SvgPicture.asset(
              'assets/icons/clipboard_check.svg',
              color: Colors.white,
              height: 28,
              width: 28,
            ),

            SvgPicture.asset(
              'assets/icons/plus.svg',
              color: Colors.white,
              height: 28,
              width: 28,
            ),

            SvgPicture.asset(
              'assets/icons/book.svg',
              color: Colors.white,
              height: 28,
              width: 28,
            ),
            SvgPicture.asset(
              'assets/icons/Customer.svg',
              color: Colors.white,
              height: 44,
              width: 44,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Feed Spaces'),
        forceMaterialTransparency: true,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
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
                            child: Text(
                              'Feed',
                              style: TextStyle(
                                  color: feedSpacesBloc.selectedTabIndex == 0
                                      ? Colors.white
                                      : AppColors.black),
                            )),
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
                          child: Text('Spaces',
                              style: TextStyle(
                                  color: feedSpacesBloc.selectedTabIndex == 1
                                      ? Colors.white
                                      : AppColors.black)),
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
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
