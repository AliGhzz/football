import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class WorldNewsApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  WorldNewsApiProvider();

  Future<dynamic> getWorldNews(
      {String language = "en", String page = '1'}) async {
    dio.options.connectTimeout = const Duration(seconds: 5);
    try {
      Response response = await dio.get("$baseUrl/worldnews",
          queryParameters: {'lang': 'en', 'page': '1'});
  
      return response;
    } on DioException catch (e) {
      return "We got error $e";
    }
  }
}
