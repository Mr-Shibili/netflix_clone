import 'package:flutter/material.dart';
import 'package:netflixclone/core/const/api_url.dart';
import 'package:netflixclone/core/constants.dart';

class MainCardView extends StatelessWidget {
  const MainCardView({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: kRadius,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage("${ApiUrls.imageBaseUrl}$image"))),
        ),
      ],
    );
  }
}
