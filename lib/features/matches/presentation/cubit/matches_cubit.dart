import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/models/leagues/matches.dart';
import 'package:football/features/matches/data/models/my_location/location.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesRepository matchesRepository;
  MatchesCubit(this.matchesRepository) : super(MatchesState(selectedIndex: 3,visitedTabs: List.filled(11, false),isLoading: true));

  void changeTab({int index=3,required BuildContext context}) {
    if (state.visitedTabs![index]==true) {
      emit(state.copyWith(selectedIndex: index-3, isLoading: false, hasError: false, errorMessage: null, visitedTabs: null));
    } else if (state.loadedData.containsKey(index-3)){
      final updatedVisitedTabs = state.visitedTabs; 
      updatedVisitedTabs![index]= true;
      emit(state.copyWith(selectedIndex: index-3, isLoading: false, hasError: false, errorMessage: null,visitedTabs: updatedVisitedTabs));
      if (index>0 && index<9){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
        getMatches(dateOffset:index-1,context: context);
        getMatches(dateOffset:index-4,context: context);
      }else if(index==0){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
      }else if(index==9){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
        getMatches(dateOffset:index-4,context: context);
      }else{
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-4,context: context);
      }

    }
    else {
      final updatedVisitedTabs = state.visitedTabs;
      updatedVisitedTabs![index]= true;
      emit(state.copyWith(selectedIndex: index-3, isLoading: true, hasError: false, errorMessage: null,visitedTabs: updatedVisitedTabs));
      if (index>0 && index<9){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
        getMatches(dateOffset:index-1,context: context);
        getMatches(dateOffset:index-4,context: context);
      }else if(index==0){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
      }else if(index==9){
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-2,context: context);
        getMatches(dateOffset:index-4,context: context);
      }else{
        getMatches(dateOffset:index-3,context: context);
        getMatches(dateOffset:index-4,context: context);
      }
    }
  }

  void getMatches ({int dateOffset=0,required BuildContext context})async{
    try{
      
      Location location = context.read<LocationCubit>().state.location;
      DataState dataState =await matchesRepository.getMatches(dateOffset: dateOffset,timezone: location.timezone!,ccode3: location.ccode3!);

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
