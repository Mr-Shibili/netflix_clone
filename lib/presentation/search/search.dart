import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/core/api/apiservices.dart';
import 'package:netflixclone/core/colors/colors.dart';
import 'package:netflixclone/core/constants.dart';
import 'package:netflixclone/domain/download_models/download_models_json.dart';
import 'package:netflixclone/presentation/search/widgets/search_idle.dart';
import 'package:netflixclone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool isSearch = false;
  final TextEditingController searchcontroller = TextEditingController();
  List<Welcome> suggestions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoSearchTextField(
                        controller: searchcontroller,
                        onChanged: (value) async {
                          final result =
                              await ApiServices.getSearchSuggestions(value);

                          if (value.isNotEmpty) {
                            setState(() {
                              isSearch = true;
                              suggestions = result;
                            });
                          } else {
                            setState(() {
                              isSearch = false;
                            });
                          }
                        },
                        backgroundColor: Colors.grey.withOpacity(0.4),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: const Icon(
                          CupertinoIcons.xmark_circle_fill,
                          color: Colors.grey,
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      khight,
                      Expanded(
                          child: !isSearch
                              ? const SearchResultWidget()
                              : SearchIdleWidget(
                                  suggestions: suggestions,
                                )),
                    ]))));
  }
}
