import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/search/widgets/title.dart';

import '../../../core/const/api_url.dart';
import '../../../domain/download_models/download_models_json.dart';

final imagetemp =
    "https://www.themoviedb.org/t/p/w220_and_h330_face/wjOHjWCUE0YzDiEzKv8AfqHj3ir.jpg";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitle(title: 'Movies & Tv'),
        khight,
        Expanded(
            child: FutureBuilder<List<Welcome>>(
                future: ApiServices.fetchMoviesByData(),
                builder: (context, movie) {
                  return (movie.hasData)
                      ? GridView.builder(
                          itemBuilder: (context, index) => MainCard(
                              poster: movie.data![index].posterPath ?? ""),
                          itemCount: movie.data!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 1.4,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                        )
                      : const Center(child: CircularProgressIndicator());
                }))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  MainCard({super.key, required this.poster});
  final String poster;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          image: DecorationImage(
              image: NetworkImage("${ApiUrls.imageBaseUrl}$poster"),
              fit: BoxFit.cover)),
    );
  }
}
