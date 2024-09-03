import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/news_api_provider.dart';
import 'package:football/features/news/data/models/trending.dart';

class NewsRepository {
  NewsApiProvider newsApiProvider;
  NewsRepository(this.newsApiProvider);

  Future<DataState> getNews({String language = "en", String ccode3 = "IRN"}) async{
    try{
      Response response   = await newsApiProvider.getNews(language: language,ccode3: ccode3);
      if (response.statusCode == 200){
        print("if (response.statusCode == 200){");
        Trending trending = Trending.fromJson(response.data);
        print("Trending trending = Trending.fromJson(response.data);");
        return DataSuccess(trending);
      }else{
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      return DataFailed("$e");
    }
  }
}