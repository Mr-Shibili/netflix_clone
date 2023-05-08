import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/constants.dart';

import '../../../core/const/api_url.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index, required this.image});
  final int index;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: kRadius,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${ApiUrls.imageBaseUrl}$image"))),
            ),
          ],
        ),
        Positioned(
            left: 5,
            bottom: -20,
            child: BorderedText(
                strokeWidth: 5.0,
                strokeColor: Colors.white,
                child: Text('${index + 1}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        decorationColor: Colors.black))))
      ],
    );
  }
}

class $ {}
