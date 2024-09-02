import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class MyLocationApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  MyLocationApiProvider();

  Future<dynamic> getMyLocation()async{
    try{
      dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get(
        '$baseUrl/mylocation',
      );
      return response;
    }on DioException catch (e) {
      return e;
    }
  }
}
