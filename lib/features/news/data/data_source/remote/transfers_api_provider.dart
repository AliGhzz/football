import 'package:dio/dio.dart';
import 'package:football/core/utils/constants.dart';
class TransfersApiProvider {
  Dio dio = Dio();
  String baseUrl = Constants.baseUrl;
  TransfersApiProvider();

  Future<dynamic> getTopTransfers ()async{
    dio.options.headers = {
      'X-Mas': 'eyJib2R5Ijp7InVybCI6Ii9hcGkvbWF0Y2hlcz9kYXRlPTIwMjUwMTExJnRpbWV6b25lPUFzaWElMkZUZWhyYW4mY2NvZGUzPUlSTiIsImNvZGUiOjE3MzY2MDI1MDEzMDMsImZvbyI6IjAzODJjNDE1NiJ9LCJzaWduYXR1cmUiOiI3NzIzNzAzRDdCNzNGQzYwN0NCMjgwQzk3RkY4Q0E1QiJ9',
    };
    try{
      dio.options.connectTimeout =const Duration(seconds: 5);
      Response response =await dio.get("$baseUrl/transfers",
        queryParameters: {
          'showTop':'true',
          'page':'1'
        }
      );
      return response;
    }on DioException catch(e){
      return 'Error: $e';
    }
  }

  Future<dynamic> getAllTransfers ()async{
    dio.options.headers = {
      'X-Mas': 'eyJib2R5Ijp7InVybCI6Ii9hcGkvbWF0Y2hlcz9kYXRlPTIwMjUwMTExJnRpbWV6b25lPUFzaWElMkZUZWhyYW4mY2NvZGUzPUlSTiIsImNvZGUiOjE3MzY2MDI1MDEzMDMsImZvbyI6IjAzODJjNDE1NiJ9LCJzaWduYXR1cmUiOiI3NzIzNzAzRDdCNzNGQzYwN0NCMjgwQzk3RkY4Q0E1QiJ9',
    };
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
