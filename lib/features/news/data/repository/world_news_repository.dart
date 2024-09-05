import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/world_news_api_provider.dart';
import 'package:football/features/news/data/models/world_news.dart';

class WorldNewsRepository {
  WorldNewsApiProvider worldNewsApiProvider;
  WorldNewsRepository(this.worldNewsApiProvider);

  Future<DataState> getWorldNews({String language = "en", String page = "1"}) async {
    try {
      Response response =
          await worldNewsApiProvider.getWorldNews(language: language, page: page);
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
