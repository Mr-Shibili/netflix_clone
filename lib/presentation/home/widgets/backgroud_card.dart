import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/const/api_url.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/home/widgets/number_button_widget.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
            future: ApiServices.fetchMoviesByData(),
            builder: (context, result) {
              final movie = result.data;
              return movie != null
                  ? Container(
                      width: double.infinity,
                      height: 600,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${ApiUrls.imageBaseUrl}${movie[0].posterPath}"))),
                    )
                  : const SizedBox(
                      width: double.infinity,
                      height: 600,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
            }),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomIconWidget(icon: Icons.add, title: "My List"),
              _playButton(),
              const CustomIconWidget(icon: Icons.info_outlined, title: 'Info')
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kwhite)),
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20),
          ),
        ));
  }
}
