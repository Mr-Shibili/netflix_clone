import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/const/api_url.dart';
import 'package:netflixclone/domain/download_models/download_models_json.dart';
import 'package:netflixclone/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

import '../../core/constants.dart';
import '../home/widgets/number_button_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text("New & Hot"),
              actions: [
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
              bottom: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: kwhite,
                  labelColor: kBlackColor,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator:
                      BoxDecoration(color: kwhite, borderRadius: kRadius30),
                  tabs: const [
                    Tab(
                      text: "🍿Coming soon",
                    ),
                    Tab(
                      text: "👀 Everyone's watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(
              children: [_buildcomingSoon(), _buildTabBarView("two")])),
    );
  }
}

Widget _buildcomingSoon() {
  return FutureBuilder<List<Welcome>>(
      future: ApiServices.getUpcomigMovies(),
      builder: (context, result) {
        final movies = result.data;
        return movies != null
            ? ListView.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, index) => movies.isEmpty
                    ? const SizedBox()
                    : ComingSoon(result: movies[index]),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      });
}

_buildTabBarView(String name) {
  return Center(
    child: Text(name),
  );
}
