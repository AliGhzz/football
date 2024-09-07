import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class LeaguesInfoApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  LeaguesInfoApiProvider();

  Future<dynamic> getAllLeaguesInfo(
      {String locale = "en",
      String country = 'IRN'}) async {
    try {
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get('$baseUrl/allLeagues', queryParameters: {
        'locale': locale,
        'country': country
      });
      return response;
    } on DioException catch (e) {
      return e;
    }
  }


  Future<dynamic> getLeagueDetails({required int leagueId}) async {
    try {
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get('$baseUrl/leagues', queryParameters: {
        'id': leagueId,
      });
      return response;
    } on DioException catch (e) {
      return e;
    }
  }

}