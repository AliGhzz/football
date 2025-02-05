import 'package:dio/dio.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/core/utils/constants.dart';
import 'package:logger/logger.dart';

class MatchesApiProvider {
  Dio dio;
  MatchesApiProvider(this.dio);

  Future<dynamic> getMatches(
      {int dateOffset = 0,
      String timezone = 'Asia/Tehran',
      String ccode3 = 'IRN'}) async {

    try {
      print("dio.options.headers "+dio.options.baseUrl);
      String date = calculateDateOffset(dateOffset);
      Response response = await dio.get('/matches', queryParameters: {
        'date': date,
        'timezone': timezone,
        'ccode3': ccode3
      });
      return response;
    } on DioException catch (e) {
      return e;
    }
  }


  Future<dynamic> getMatcheDetails({required int matchId }) async {
    try {
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get('/matchDetails', queryParameters: {
        'matchId': matchId,
      });
      return response;
    } on DioException catch (e) {
      return e;
    }
  }
}
