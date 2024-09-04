import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class LeaguesInfoApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  LeaguesInfoApiProvider();

  Future<dynamic> getLeaguesInfo(
      {String locale = "en",
      String country = 'IRN'}) async {
    try {
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      print("dio.options.connectTimeout = const Duration(milliseconds: 5000);");
      Response response = await dio.get('$baseUrl/allLeagues', queryParameters: {
        'locale': locale,
        'country': country
      });
      print("Response response = await dio.get(");
      // print(response.data);
      return response;
    } on DioException catch (e) {
      return e;
    }
  }
}