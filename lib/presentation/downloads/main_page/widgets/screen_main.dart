import 'package:flutter/material.dart';

import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/presentation/downloads/screen_downloads.dart';
import 'package:netflixclone/presentation/downloads/widgets/bottom_nav.dart';
import 'package:netflixclone/presentation/fast_laughs/fast_laughs.dart';
import 'package:netflixclone/presentation/home/screen_home.dart';
import 'package:netflixclone/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflixclone/presentation/search/search.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaughs(),
    const ScreenSearch(),
    ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
