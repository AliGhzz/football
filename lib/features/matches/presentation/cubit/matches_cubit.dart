import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/models/leagues/matches.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesRepository matchesRepository;
  MatchesCubit(this.matchesRepository) : super(MatchesState(selectedIndex: 3,visitedTabs: List.filled(11, false),isLoading: true));

  void changeTab({int index=3}) {
    if (state.visitedTabs![index]==true) {
      emit(state.copyWith(selectedIndex: index-3, isLoading: false, hasError: false, errorMessage: null, visitedTabs: null));
    } else if (state.loadedData.containsKey(index-3)){
      final updatedVisitedTabs = state.visitedTabs; 
      updatedVisitedTabs![index]= true;
      emit(state.copyWith(selectedIndex: index-3, isLoading: false, hasError: false, errorMessage: null,visitedTabs: updatedVisitedTabs));
      if (index>0 && index<9){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
        getMatches(dateOffset:index-1);
        getMatches(dateOffset:index-4);
      }else if(index==0){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
      }else if(index==9){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
        getMatches(dateOffset:index-4);
      }else{
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-4);
      }

    }
    else {
      final updatedVisitedTabs = state.visitedTabs;
      updatedVisitedTabs![index]= true;
      emit(state.copyWith(selectedIndex: index-3, isLoading: true, hasError: false, errorMessage: null,visitedTabs: updatedVisitedTabs));
      if (index>0 && index<9){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
        getMatches(dateOffset:index-1);
        getMatches(dateOffset:index-4);
      }else if(index==0){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
      }else if(index==9){
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-2);
        getMatches(dateOffset:index-4);
      }else{
        getMatches(dateOffset:index-3);
        getMatches(dateOffset:index-4);
      }
    }
  }

  void getMatches ({int dateOffset=0, String timezone='Asia/Tehran',String ccode3='IRN'})async{
    try{
      
      DataState dataState =await matchesRepository.getMatches(dateOffset: dateOffset,timezone: timezone,ccode3: ccode3);

      if(dataState is DataSuccess){
        
        final updatedData = Map<int, Matches?>.from(state.loadedData);
        updatedData[dateOffset] = dataState.data;
        
        emit(state.copyWith(isLoading: false, loadedData: updatedData, hasError: false, errorMessage: null));
      }else if (dataState is DataFailed){
        emit(state.copyWith(isLoading: false, hasError: true, errorMessage: 'Failed to load data'));
      }
    }catch (e){
      emit(state.copyWith(isLoading: false, hasError: true, errorMessage: e.toString()));
    }
    
  }
}
