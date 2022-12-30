import 'dart:convert';

List<WatchList> WatchListFromJson(String str) =>
    List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String WatchListToJson(List<WatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
  WatchList(
      {required this.title,
        required this.release_date,
        required this.rating,
        required this.watched,
        required this.review});

  String title;
  String release_date;
  int rating;
  bool watched;
  String review;

  void changeStatus() {
    this.watched = !this.watched;
  }

  factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
    title: json["fields"]["title"],
    release_date: json["fields"]["release_date"],
    rating: json["fields"]["rating"],
    watched: json["fields"]["watched"],
    review: json["fields"]["review"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "release_date": release_date,
    "rating": rating,
    "review": review,
    "watched": watched,
  };
}