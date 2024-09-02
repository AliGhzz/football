import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/data_source/remote/my_location_api_provider.dart';
import 'package:football/features/matches/data/models/my_location/location.dart';

class MyLocationRepository {
  MyLocationApiProvider myLocationApiProvider;
  MyLocationRepository(this.myLocationApiProvider);

  Future<DataState> getMyLocation()async{

    try{
      Response response = await myLocationApiProvider.getMyLocation();
      
      if(response.statusCode == 200){
        Location location = Location.fromJson(response.data);
      
        return DataSuccess(location);
      }else{
        return DataFailed("${response.statusMessage}");
      }
    }catch (e){
      return const DataFailed("location please check your connection");
    }

  }
}