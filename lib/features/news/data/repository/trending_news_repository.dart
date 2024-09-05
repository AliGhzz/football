import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/trending_news_api_provider.dart';
import 'package:football/features/news/data/models/trending_news.dart';

class TrendingNewsRepository {
  TrendingNewsApiProvider trendingNewsApiProvider;
  TrendingNewsRepository(this.trendingNewsApiProvider);

  Future<DataState> getTrendingNews(
      {String language = "en", String ccode3 = "IRN"}) async {
    
    try {
      Response response =
          await trendingNewsApiProvider.getTrendingNews(language: language, ccode3: ccode3);
      if (response.statusCode == 200) {
        TrendingNews trending = TrendingNews.fromJson(response.data);
        return DataSuccess(trending);
      } else {
        return DataFailed(response.statusMessage);
      }
    } catch (e) {
      return DataFailed("$e");
    }
  }
}
