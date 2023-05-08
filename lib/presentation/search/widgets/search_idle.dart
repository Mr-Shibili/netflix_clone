import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/const_styles.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

import '../../../core/const/api_url.dart';
import '../../../domain/download_models/download_models_json.dart';

class SearchIdleWidget extends StatelessWidget {
  SearchIdleWidget({super.key, required this.suggestions});
  List<Welcome> suggestions = [];
  final imageUrls = [
    "https://www.themoviedb.org/t/p/w250_and_h141_face/xDMIl84Qo5Tsu62c9DGWhmPI67A.jpg",
    "https://www.themoviedb.org/t/p/w250_and_h141_face/2YdWh0vZ3iMV9MP5ntRVj23ei65.jpg"
  ];
  final title = "Top Searches";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTitle(title: title),
        khight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  TopSearchItemTile(result: suggestions[index]),
              separatorBuilder: (context, index) => khight20,
              itemCount: suggestions.length),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  TopSearchItemTile({super.key, required this.result});
  final Welcome result;

  @override
  Widget build(BuildContext context) {
    print(result.backdropPath);
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
            width: screenWidth * .35,
            height: 65,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${ApiUrls.imageBaseUrl}${result.posterPath}")))),
        kwidth,
        Expanded(
          child: Text(
            "${result.title}",
            style: movieNameHead,
          ),
        ),
        const Icon(
          Icons.play_circle_outline_sharp,
          color: Colors.white,
          size: 50,
        ),
      ],
    );
  }
}
