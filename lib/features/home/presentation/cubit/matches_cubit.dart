import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/home/data/models/leagues/matches.dart';
import 'package:football/features/home/data/repository/matches_repository.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesRepository matchesRepository;
  MatchesCubit(this.matchesRepository) : super(MatchesLoading());
  
  void getMatches ({int dateOffset=0, String timezone='Asia/Tehran',String ccode3='IRN'})async{
    emit(MatchesLoading());
    try{
      
      DataState dataState =await matchesRepository.getMatches(dateOffset: dateOffset,timezone: timezone,ccode3: ccode3);
      
      if(dataState is DataSuccess){
        emit(MatchesLoaded(matches:dataState.data));
      }else if (dataState is DataFailed){
        emit(MatchesError(error: dataState.error!));
      }
    }catch (e){
      emit(MatchesError(error: "somethig went wrong"));
    }
    
  }
}
