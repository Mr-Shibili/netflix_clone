// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String? backdropPath;
  int? id;
  String? title;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;

  Welcome({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });
  // factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
  //       backdropPath: json["backdrop_path"],
  //       id: json["id"],
  //       title: json["title"] ?? json["name"],
  //       originalTitle: json["original_title"] ?? json["original_name"],
  //       overview: json["overview"],
  //       posterPath: json["poster_path"],
  //       releaseDate: DateTime.parse(json["release_date"]),
  //     );
  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        backdropPath: json["backdropPath"] ?? "",
        id: json["id"] ?? "",
        originalTitle: json["original_title"] ?? "",
        overview: json["overview"] ?? "",
        posterPath: json["poster_path"] ?? "",
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "title": title,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate
      };
}
 //"${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",