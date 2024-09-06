import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/transfers_api_provider.dart';
import 'package:football/features/news/data/models/transfers/transfers.dart';
import 'package:logger/logger.dart';

class TransfersRepository {
  TransfersApiProvider transfersApiProvider;
  TransfersRepository(this.transfersApiProvider);

  Future<DataState> getTopTransfers()async{ 
    try{
      Response response = await transfersApiProvider.getTopTransfers();
      if(response.statusCode == 200){
        print("if(response.statusCode == 200){");
        // Logger().i(response.data);
        Transfers transfers = Transfers.fromJson(response.data);
        print("Transfers transfers = Transfers.fromJson(response.data);");
        return DataSuccess(transfers);
      }else{
        print("DataFailed(response.statusMessage);");
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      print("DataFailed('$e');");
      return DataFailed("$e");
    }
  }

  Future<DataState> getAllTransfers()async{
    try{
      Response response = await transfersApiProvider.getAllTransfers();
      if(response.statusCode == 200){
        Transfers transfers = Transfers.fromJson(response.data);
        return DataSuccess(transfers);
      }else{
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      return DataFailed("$e");
    }
  }

}