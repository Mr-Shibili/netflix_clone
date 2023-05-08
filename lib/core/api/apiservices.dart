import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:netflixclone/core/const/api_url.dart';
import '../../domain/download_models/download_models_json.dart';
import '../const/api_key.dart';

class ApiServices {
  static Future<List<Welcome>> fetchMoviesByData() async {
    List<Welcome> result = [];
    try {
      final response = await http.get(Uri.parse(ApiUrls.trending));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var element in data["results"]) {
          result.add(Welcome.fromJson(element));
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log('Error fetching data: $e');
    }
    return result;
  }

  static Future<List<Welcome>> getSearchSuggestions(String query) async {
    final response = await http.get(
      Uri.parse(
        '$baseurl/search/movie?api_key=$apiKey&query=$query',
      ),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Welcome> suggestions = [];
      for (var result in data["results"]) {
        suggestions.add(
          Welcome.fromJson(result),
        );
      }
      return suggestions;
    } else {
      throw Exception("Failed to fetch search suggestions");
    }
  }

  static Future<List<Welcome>> getUpcomigMovies() async {
    List<Welcome> result = [];
    try {
      final response = await http.get(Uri.parse(ApiUrls.upcomingBaseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var element in data["results"]) {
          result.add(Welcome.fromJson(element));
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log('Error fetching data: $e');
    }
    return result;
  }

  static Future<List<Welcome>> fetchHomeData(String movie, String type) async {
    List<Welcome> result = [];
    try {
      final response = await http.get(Uri.parse(
          "https://api.themoviedb.org/3/$movie/$type?api_key=$apiKey"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        for (var element in data["results"]) {
          result.add(Welcome.fromJson(element));
        }
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      log('Error fetching data: $e');
    }
    return result;
  }
}
