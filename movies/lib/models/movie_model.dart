import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releasesDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  MovieModel({
    required this.id,
    required this.title,
    required this.releasesDate,
    required this.posterPath,
    required this.genres,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'releases_date': releasesDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  // factory MovieModel.fromMap(Map<String, dynamic> map) {
  //   return MovieModel(
  //     id: map['id'],
  //     title: map['title'],
  //     releasesDate: map['releasesDate'],
  //     posterPath: map['posterPath'],
  //     genres: List<int>.from(map['genres']),
  //     favorite: map['favorite'],
  //   );
  // }


   factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      releasesDate: map['releases_date'] ?? '',
      posterPath: map['poster_path'] ?? '',
      genres: List<int>.from(map['genre_ids'] ?? const []),
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) => MovieModel.fromMap(json.decode(source));
}
