import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/leagues/data/repository/leagues_info_repository.dart';
import 'package:meta/meta.dart';

part 'leagues_state.dart';

class LeaguesCubit extends Cubit<LeaguesState> {
  LeaguesInfoRepository leaguesInfoRepository;
  LeaguesCubit(this.leaguesInfoRepository) : super(LeaguesInitial());

  Future<String?> getLeagueDetails ({required int leagueId})async{
    try{
      DataState dataState = await leaguesInfoRepository.getLeagueDetails(leagueId: leagueId);
      if(dataState is DataSuccess){
        return dataState.data;
      }else{
        return null;
      }
    }catch (e){
      return null;
    }
  }
}
