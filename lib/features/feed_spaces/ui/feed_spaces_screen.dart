import 'package:feed_spaces/features/feed_spaces/bloc/feed_spaces_bloc.dart';
import 'package:feed_spaces/features/feed_spaces/ui/widgets/feed_screen.dart';
import 'package:feed_spaces/features/feed_spaces/ui/widgets/spaces_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      appBar: AppBar(
        title: Text('Feed Spaces'),
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
                                      ? Colors.orange
                                      : Colors.grey.shade200)),
                          onPressed: () {
                            feedSpacesBloc.add(TabChangeEvent(index: 0));
                          },
                          child: Text('Feed')),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Tab(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                feedSpacesBloc.selectedTabIndex == 1
                                    ? Colors.orange
                                    : Colors.grey.shade200)),
                        onPressed: () {
                          feedSpacesBloc.add(TabChangeEvent(index: 1));
                        },
                        child: Text('Spaces'),
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
