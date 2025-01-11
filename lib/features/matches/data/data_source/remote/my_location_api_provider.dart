import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';

class MyLocationApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  MyLocationApiProvider();

  Future<dynamic> getMyLocation() async {
    try {
      print("api try { getLocation");
      // dio.options.connectTimeout = const Duration(milliseconds: 5000);
      Response response = await dio.get(
        '$baseUrl/mylocation',
      );
      print("api response { getLocation \n ${response.data}");
      return response;
    } on DioException catch (e) {
      print("api } on DioException catch (e) { getLocation");
      return e;
    }
  }
}
