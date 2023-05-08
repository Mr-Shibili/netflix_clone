import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/presentation/home/widgets/number_card.dart';

import '../../core/constants.dart';
import '../widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          title: "Top 10 Tv Shows In India Today",
        ),
        khight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
              future: ApiServices.getUpcomigMovies(),
              builder: (context, result) {
                if (result.hasData) {
                  final movie = result.data;
                  movie!.shuffle();
                  return ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                          movie.length,
                          (index) => NumberCard(
                              index: index, image: movie[index].posterPath!)));
                }
                return const Center(child: CircularProgressIndicator());
              }),
        )
      ],
    );
  }
}
