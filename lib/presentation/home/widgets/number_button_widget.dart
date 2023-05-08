import 'package:flutter/material.dart';
import 'package:netflixclone/core/colors/colors.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.iconSize = 30,
      this.textSize = 18});
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        color: kwhite,
        size: iconSize,
      ),
      Text(
        title,
        style: TextStyle(fontSize: textSize),
      )
    ]);
  }
}
