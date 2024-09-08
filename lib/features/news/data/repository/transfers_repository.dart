import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/data_source/remote/transfers_api_provider.dart';
import 'package:football/features/news/data/models/transfers/top_transfers.dart';

class TransfersRepository {
  TransfersApiProvider transfersApiProvider;
  TransfersRepository(this.transfersApiProvider);

  Future<DataState> getTopTransfers()async{ 
    try{
      Response response = await transfersApiProvider.getTopTransfers();
      if(response.statusCode == 200){
        TopTransfers transfers = TopTransfers.fromJson(response.data);
        return DataSuccess(transfers);
      }else{
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      return DataFailed("$e");
    }
  }

  Future<DataState> getAllTransfers()async{
    try{
      Response response = await transfersApiProvider.getAllTransfers();
      if(response.statusCode == 200){
        TopTransfers transfers = TopTransfers.fromJson(response.data);
        return DataSuccess(transfers);
      }else{
        return DataFailed(response.statusMessage);
      }
    }catch (e){
      return DataFailed("$e");
    }
  }

}