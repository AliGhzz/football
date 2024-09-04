import 'package:football/features/news/data/models/news.dart';

class WorldNews {
  List<News>? news;
  WorldNews(this.news);

  factory WorldNews.fromJson(List json) {
    return WorldNews((json as List<dynamic>?)
        ?.map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList());
  }
}
 