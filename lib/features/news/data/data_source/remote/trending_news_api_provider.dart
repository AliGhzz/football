import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';
import 'package:logger/logger.dart';

class TrendingNewsApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  TrendingNewsApiProvider();

  Future<dynamic> getTrendingNews(
      {String language = "en", String ccode3 = ' IRN'}) async {
    dio.options.connectTimeout = const Duration(seconds: 5);
    try {
      Response response = await dio.get("$baseUrl/trendingnews",
          queryParameters: {'lang': 'en', 'ccode3': 'IRN'});
      Logger().i(response.data);
      return response;
    } on DioException catch (e) {
      return "We got error $e";
    }
  }
}
