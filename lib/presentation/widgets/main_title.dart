import 'package:flutter/material.dart';
import 'package:netflixclone/core/const_styles.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, this.title});
  final title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: mainHead,
    );
  }
}
