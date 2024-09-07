import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/news_api_provider.dart';
import 'package:football/features/news/data/models/news_models/trending_news.dart';
import 'package:football/features/news/data/models/news_models/world_news.dart';

class NewsRepository {
  NewsApiProvider newsApiProvider;
  NewsRepository(this.newsApiProvider);

  Future<DataState> getTrendingNews(
      {String language = "en", String ccode3 = "IRN"}) async {
    
    try {
      Response response =
          await newsApiProvider.getTrendingNews(language: language, ccode3: ccode3);
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


    Future<DataState> getWorldNews({String language = "en", String page = "1"}) async {
    try {
      Response response =
          await newsApiProvider.getWorldNews(language: language, page: page);
      if (response.statusCode == 200) {
        WorldNews woeldNews = WorldNews.fromJson(response.data);
        return DataSuccess(woeldNews);
      } else {
        return DataFailed(response.statusMessage);
      }
    } catch (e) {
      return DataFailed("$e");
    }
  }

}
