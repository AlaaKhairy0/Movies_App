import 'genre.dart';

class CategoriesResponse {
  CategoriesResponse({
      this.genres,
    this.statusMessage,
  });

  CategoriesResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genre.fromJson(v));
      });
    }
    statusMessage = json['status_message'];
  }
  List<Genre>? genres;
  String? statusMessage;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}