import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/const/api_url.dart';
import 'package:netflixclone/core/const_styles.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgets = [const _smartDownloads(), Section2(), const Section3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) => _widgets[index],
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemCount: _widgets.length));
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: ApiServices.fetchMoviesByData(),
        builder: (
          context,
          value,
        ) {
          return Column(
            children: [
              const Text('Introducing Downloads For You',
                  textAlign: TextAlign.center, style: mainHead),
              khight,
              const Text(
                  "We will download a personalised selection of\n movies and shows for you, so ther's\nalways something to watch on your\ndevice",
                  textAlign: TextAlign.center,
                  style: secondHead),
              SizedBox(
                width: size.width,
                height: size.width,
                child: value.hasData
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.33,
                            backgroundColor: Colors.grey.withOpacity(0.5),
                          ),
                          DownloadsImageWidget(
                            imageList: value.data![0].posterPath!,
                            margin: const EdgeInsets.only(
                              left: 170,
                            ),
                            angle: 25,
                            size: Size(size.width * 0.3, size.width * 0.5),
                          ),
                          DownloadsImageWidget(
                            imageList: value.data![1].posterPath!,
                            margin: const EdgeInsets.only(
                              right: 170,
                            ),
                            angle: -20,
                            size: Size(size.width * 0.3, size.width * 0.5),
                          ),
                          DownloadsImageWidget(
                            imageList: value.data![2].posterPath!,
                            radius: 8,
                            margin: const EdgeInsets.only(bottom: 10),
                            size: Size(size.width * 0.35, size.width * 0.55),
                          )
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        });
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("Set up",
                  style: TextStyle(
                      color: kwhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        khight,
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text("See what you can download",
                  style: TextStyle(
                      color: kBlackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        )
      ],
    );
  }
}

class _smartDownloads extends StatelessWidget {
  const _smartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhite,
        ),
        Text('Smart Downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {super.key,
      this.angle = 0,
      required this.imageList,
      required this.margin,
      required this.size,
      this.radius = 10});

  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.white30,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      "${ApiUrls.imageBaseUrl}$imageList",
                    ))),
          ),
        ),
      ),
    );
  }
}
