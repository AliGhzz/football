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
      : super(MatchesState(selectedIndex: 3, isLoading: true));

  void changeTab({int index = 3, required BuildContext context}) {
    if (state.loadedData.containsKey(index - 3)) {
      DateTime lastTime = DateTime.now();
      Duration duration = lastTime.difference(state.dateTime!);
      print("duration.inSeconds: ${duration.inSeconds}");
      if (duration.inSeconds > 600) {
        emit(state.copyWith(
            selectedIndex: index - 3,
            isLoading: false,
            hasError: false,
            errorMessage: null,
            dateTime: lastTime));

        Future.wait([
          getMatches(dateOffset: -3, context: context),
          getMatches(dateOffset: -2, context: context),
          getMatches(dateOffset: -1, context: context),
          getMatches(dateOffset: 0, context: context),
          getMatches(dateOffset: 1, context: context),
          getMatches(dateOffset: 2, context: context),
          getMatches(dateOffset: 3, context: context),
          getMatches(dateOffset: 4, context: context),
          getMatches(dateOffset: 5, context: context),
          getMatches(dateOffset: 6, context: context),
          getMatches(dateOffset: 7, context: context),
        ]);
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
          hasError: false,
          errorMessage: null,
          dateTime: DateTime.now()));
      Future.wait([
        getMatches(dateOffset: -3, context: context),
        getMatches(dateOffset: -2, context: context),
        getMatches(dateOffset: -1, context: context),
        getMatches(dateOffset: 0, context: context),
        getMatches(dateOffset: 1, context: context),
        getMatches(dateOffset: 2, context: context),
        getMatches(dateOffset: 3, context: context),
        getMatches(dateOffset: 4, context: context),
        getMatches(dateOffset: 5, context: context),
        getMatches(dateOffset: 6, context: context),
        getMatches(dateOffset: 7, context: context),
      ]);
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
            isLoading: false,
            loadedData: updatedData,
            hasError: false,
            errorMessage: null));
      } else if (dataState is DataFailed) {
        emit(state.copyWith(
            isLoading: false,
            hasError: true,
            errorMessage: 'Failed to load data'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, hasError: true, errorMessage: e.toString()));
    }
  }
}
