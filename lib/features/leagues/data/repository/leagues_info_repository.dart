import 'package:dio/dio.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/leagues/data/data_source/remote/leagues_info_api_provider.dart';
import 'package:football/features/leagues/data/models/leagues_info.dart';

class LeaguesInfoRepository {
  LeaguesInfoApiProvider leaguesInfoApiProvider;
  LeaguesInfoRepository(this.leaguesInfoApiProvider);

  Future<DataState> getLeaguesInfo()async{
    try{
      Response response =await leaguesInfoApiProvider.getAllLeaguesInfo();
      if(response.statusCode == 200){
        LeaguesInfo leaguesInfo = LeaguesInfo.fromJson(response.data);
        return DataSuccess(leaguesInfo);
      }else{
        return DataFailed("DataFailed: ${response.statusMessage}");
      }
    }catch (e){
      return DataFailed("catch (e): $e");
    }
  }

    Future<DataState> getLeagueDetails({required int leagueId})async{
    try{
      Response response =await leaguesInfoApiProvider.getLeagueDetails(leagueId: leagueId);
      if(response.statusCode == 200){
        return DataSuccess(response.data["details"]["breadcrumbJSONLD"]["itemListElement"][1]["item"]);
      }else{
        return DataFailed("DataFailed: ${response.statusMessage}");
      }
    }catch (e){
      return DataFailed("catch (e): $e");
    }

  }
}