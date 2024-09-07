import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';
class TransfersApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  TransfersApiProvider();

  Future<dynamic> getTopTransfers ()async{
    try{
      dio.options.connectTimeout =const Duration(seconds: 5);
      print("TransfersApiProvider");
      Response response =await dio.get("$baseUrl/transfers",
        queryParameters: {
          'showTop':'true',
          'page':'1'
        }
      );
      print("response.data");
      // Logger().i(response.data);
      return response;
    }on DioException catch(e){
      return 'Error: $e';
    }
  }

  Future<dynamic> getAllTransfers ()async{
    try{
      dio.options.connectTimeout =const Duration(seconds: 5);
      Response response =await dio.get("$baseUrl/transfers",
        queryParameters: {
          'page':'1'
        }
      );
      return response;
    }on DioException catch(e){
      return 'Error: $e';
    }
  } 
}
