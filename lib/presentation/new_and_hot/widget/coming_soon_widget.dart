import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/core/const/api_url.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../../domain/download_models/download_models_json.dart';
import '../../home/widgets/number_button_widget.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.result,
  });
  final Welcome result;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(result.backdropPath);

    return Row(children: [
      SizedBox(
        width: 50,
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              month("MONTH") ?? '',
              style: const TextStyle(fontSize: 20, color: kgreycolor),
            ),
            Text(
              month("DAY") ?? '',
              style: const TextStyle(
                  fontSize: 30, letterSpacing: 4, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      SizedBox(
        width: size.width - 50,
        height: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            khight,
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    "${ApiUrls.imageBaseUrl}${result.posterPath}",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      radius: 22,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.volume_off,
                            size: 20,
                            color: kwhite,
                          ))),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    result.title!,
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: const [
                    CustomIconWidget(
                      icon: Icons.notifications_none,
                      title: 'Remind me',
                      iconSize: 20,
                      textSize: 10,
                    ),
                    kwidth,
                    CustomIconWidget(
                      icon: Icons.info_outline_rounded,
                      title: 'info',
                      iconSize: 20,
                      textSize: 10,
                    ),
                    kwidth
                  ],
                )
              ],
            ),
            khight,
            const Text("Coming on friday"),
            khight,
            Text(
              result.title ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            khight,
            Text(
              result.overview ?? '',
              style: const TextStyle(color: kgreycolor),
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
            )
          ],
        ),
      ),
    ]);
  }

  String? month(String val) {
    if (val == "MONTH") {
      return DateFormat(DateFormat.ABBR_MONTH).format(result.releaseDate!);
    } else if (val == "DAY") {
      return DateFormat(DateFormat.DAY).format(result.releaseDate!);
    }
    return '';
  }
}
