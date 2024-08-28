
import 'package:dio/dio.dart';
import 'package:football/core/utils/calculate_date_offset.dart';
import 'package:football/core/utils/constants.dart';

class MatchesApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  MatchesApiProvider();

  Future<dynamic> getMatches({int dateOffset=0, String timezone='Asia/Tehran',String ccode3='IRN'})async{
    try{

      String date = calculateDateOffset(dateOffset);
      dio.options.connectTimeout = const Duration(milliseconds: 5000);

      Response response = await dio.get(
        '$baseUrl/matches',
        queryParameters: {
          'date':date, 
          'timezone':timezone, 
          'ccode3':ccode3
        }
      );

      
      return response;

    }on DioException catch (e) {
      return e;
    }
  }
}

