import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/presentation/fast_laughs/widgets/video_list_item.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: ApiServices.fetchMoviesByData(),
              builder: (context, result) {
                if (result.hasData) {
                  return PageView(
                      scrollDirection: Axis.vertical,
                      children: List.generate(
                          20,
                          (index) => VideoListItem(
                                index: index,
                              )));
                }
                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
