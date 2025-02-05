import 'package:dio/dio.dart';
class MyLocationApiProvider {
  Dio dio = Dio();
  MyLocationApiProvider();

  Future<dynamic> getMyLocation() async {
    try {
      dio.options.baseUrl="https://pub.fotmob.com/prod/pub/odds";
      Response response = await dio.get('/mylocation');
      print("api response { getLocation \n ${response.data}");
      return response;
    } on DioException catch (e) {
      print("api } on DioException catch (${e}) { getLocation");
      return e;
    }
  }
}

