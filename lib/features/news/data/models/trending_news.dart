import 'package:football/features/news/data/models/news.dart';

class TrendingNews {
  List<News>? news;
  TrendingNews(this.news);

  factory TrendingNews.fromJson(List json) {
    return TrendingNews((json as List<dynamic>?)
        ?.map((e) => News.fromJson(e as Map<String, dynamic>))
        .toList());
  }
}
