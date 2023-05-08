import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/main_card.dart';
import 'package:netflixclone/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.title,
    required this.type,
  });
  final String title;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(
          title: title,
        ),
        khight,
        LimitedBox(
            maxHeight: 200,
            child: FutureBuilder(
                future: ApiServices.fetchHomeData("movie", type),
                builder: (context, result) {
                  if (result.hasData) {
                    final movie = result.data;
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(movie!.length, (index) {
                          return MainCardView(
                            image: movie[index].posterPath!,
                          );
                        }));
                  }
                  return const Center(child: CircularProgressIndicator());
                }))
      ],
    );
  }
}
