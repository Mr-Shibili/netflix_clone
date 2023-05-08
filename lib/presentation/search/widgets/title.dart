import 'package:flutter/material.dart';
import 'package:netflixclone/core/const_styles.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: mainHead,
    );
  }
}
