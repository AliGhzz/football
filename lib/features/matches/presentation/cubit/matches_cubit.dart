import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/dependency_injection/service_locator.dart';
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

  void changeTab({int index = 3}) async{
    if (state.loadedData.containsKey(index - 3)) {
      DateTime lastTime = DateTime.now();
      Duration duration = lastTime.difference(state.dateTime!);
      if (duration.inSeconds > 60) {
        emit(state.copyWith(
            selectedIndex: index - 3,
            isLoading: false,
            hasError: false,
            errorMessage: null,
            dateTime: lastTime));
        print("---await1 Future.wait(");
        await Future.wait(
          List.generate(11, (index)=>getMatches(dateOffset:index-3))
          );
        print("---await2 Future.wait(");
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
        print("await1 Future.wait(");
        await Future.wait(
          List.generate(11, (index)=>getMatches(dateOffset:index-3))
         );
        
        emit(state.copyWith(
          isLoading: false,
          isLoaded: true,
          hasError: false,
          errorMessage: null,
          dateTime: DateTime.now()));
        print("await2 Future.wait(");
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
      {int dateOffset = 0}) async {
    try {
      Location location = getIt<LocationCubit>().state.location;
      print("timezone: ${location.timezone} --- ${location.ccode3}");
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
