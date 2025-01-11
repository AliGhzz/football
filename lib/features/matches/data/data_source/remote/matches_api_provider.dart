import 'package:dio/dio.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/core/utils/constants.dart';

class MatchesApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  MatchesApiProvider();

  Future<dynamic> getMatches(
      {int dateOffset = 0,
      String timezone = 'Asia/Tehran',
      String ccode3 = 'IRN'}) async {

    dio.options.headers = {
      'X-Mas': 'eyJib2R5Ijp7InVybCI6Ii9hcGkvbWF0Y2hlcz9kYXRlPTIwMjUwMTExJnRpbWV6b25lPUFzaWElMkZUZWhyYW4mY2NvZGUzPUlSTiIsImNvZGUiOjE3MzY2MDI1MDEzMDMsImZvbyI6IjAzODJjNDE1NiJ9LCJzaWduYXR1cmUiOiI3NzIzNzAzRDdCNzNGQzYwN0NCMjgwQzk3RkY4Q0E1QiJ9',
    };
    try {
      String date = calculateDateOffset(dateOffset);
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get('$baseUrl/matches', queryParameters: {
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
      Response response = await dio.get('$baseUrl/matchDetails', queryParameters: {
        'matchId': matchId,
      });
      return response;
    } on DioException catch (e) {
      return e;
    }
  }
}
