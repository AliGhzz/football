import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/models/all_matches/matches.dart';
import 'package:football/features/matches/data/models/my_location/location.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';

part 'matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  MatchesRepository matchesRepository;
  MatchesCubit(this.matchesRepository)
      : super(MatchesState(selectedIndex: 3, isLoading: true,isLoaded: false));

  void changeTab({int index = 3, required BuildContext context}) async{
    if (state.loadedData.containsKey(index - 3)) {
      DateTime lastTime = DateTime.now();
      Duration duration = lastTime.difference(state.dateTime!);
      if (duration.inSeconds > 600) {
        emit(state.copyWith(
            selectedIndex: index - 3,
            isLoading: false,
            hasError: false,
            errorMessage: null,
            dateTime: lastTime));

        await Future.wait(
          List.generate(11, (index)=>getMatches(dateOffset:index-3, context: context))
          );
        emit(state.copyWith(
          isLoading: false,
          isLoaded: true,
          errorMessage: null,
          dateTime: DateTime.now()));
      } else {
        emit(state.copyWith(
            selectedIndex: index - 3,
            isLoading: false,
            hasError: false,
            errorMessage: null));
      }
    } else {
      emit(state.copyWith(
          selectedIndex: index - 3,
          isLoading: true,
          isLoaded: false,
          hasError: false,
          errorMessage: null,
          dateTime: DateTime.now()));
      try{
        await Future.wait(
          List.generate(11, (index)=>getMatches(dateOffset:index-3, context: context))
         );

        emit(state.copyWith(
          isLoading: false,
          isLoaded: true,
          hasError: false,
          errorMessage: null,
          dateTime: DateTime.now()));
      }catch (e){
        emit(state.copyWith(
          isLoading: false,
          isLoaded: false,
          hasError: true,
          errorMessage:"$e",
          dateTime: DateTime.now()));
      }
      

    }
  }

  Future<void> getMatches(
      {int dateOffset = 0, required BuildContext context}) async {
    try {
      Location location = context.read<LocationCubit>().state.location;
      DataState dataState = await matchesRepository.getMatches(
          dateOffset: dateOffset,
          timezone: location.timezone!,
          ccode3: location.ccode3!);

      if (dataState is DataSuccess) {
        final updatedData = Map<int, Matches?>.from(state.loadedData);
        updatedData[dateOffset] = dataState.data;

        emit(state.copyWith(
            loadedData: updatedData,
            hasError: false,
            errorMessage: null));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(
            hasError: true,
            errorMessage: 'Failed to load data'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, hasError: true, errorMessage: e.toString()));
    }
  }
}
