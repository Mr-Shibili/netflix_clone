import 'package:netflixclone/core/const/api_key.dart';

class ApiUrls {
  static const baseurl = "https://api.themoviedb.org/3";
  static const trending = "$baseurl/trending/all/day?api_key=$apiKey";
  static const Search = '$baseurl/search/movie?api_key=$apiKey&query=';

  static const imageBaseUrl = "https://image.tmdb.org/t/p/original/";
  static const upcomingBaseUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1";
}
