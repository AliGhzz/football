import 'package:football/features/news/data/models/news.dart';

class Trending {
  List<News>? news;
  Trending(this.news);

  factory Trending.fromJson(List json) {
    return Trending((json as List<dynamic>?)
        ?.map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList());
  }
}
