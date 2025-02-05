import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class NewsApiProvider {
  Dio dio;
  NewsApiProvider(this.dio);
  
  Future<dynamic> getTrendingNews(
      {String language = "en", String ccode3 = ' IRN'}) async {
    
    try {
      Response response = await dio.get("/trendingnews",
          queryParameters: {'lang': 'en', 'ccode3': 'IRN'});
      return response;
    } on DioException catch (e) {
      return "We got error $e";
    }
  }

  Future<dynamic> getWorldNews(
      {String language = "en", String page = '1'}) async {
    
    try {
      Response response = await dio.get("/worldnews",
          queryParameters: {'lang': 'en', 'page': '1'});
  
      return response;
    } on DioException catch (e) {
      return "We got error $e";
    }
  }


  

}
