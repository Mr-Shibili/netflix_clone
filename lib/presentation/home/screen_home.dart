import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflixclone/core/const_styles.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/number_title_card.dart';
import 'package:netflixclone/presentation/home/widgets/backgroud_card.dart';
import 'package:netflixclone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (BuildContext context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      ListView(
                        children: const [
                          BackgroundCard(),
                          MainTitleCard(
                              title: "Released in the past year",
                              type: 'top_rated'),
                          khight,
                          MainTitleCard(title: "Trending Now", type: "popular"),
                          khight,
                          NumberTitleCard(),
                          khight,
                          MainTitleCard(
                              title: "Tense Dramas", type: "upcoming"),
                          khight,
                          MainTitleCard(
                              title: "South Indian Cinema",
                              type: "now_playing"),
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Image.network(
                                      kNetflixLogo,
                                      width: 70,
                                      height: 70,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.cast,
                                      color: Colors.white,
                                    ),
                                    kwidth,
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.blue,
                                    ),
                                    kwidth,
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "TV Shows",
                                      style: secondHead.copyWith(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Movies",
                                      style: secondHead.copyWith(
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Categories",
                                      style: secondHead.copyWith(
                                          color: Colors.white),
                                    )
                                  ],
                                )
                              ]),
                            )
                          : khight
                    ],
                  ),
                ),
              );
            }));
  }
}
