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
      : super(MatchesState(selectedIndex: 3, isLoading: true,isLoaded: false,dateTime: DateTime.now()));

  void changeTab({int index = 3}) async{
    state.loadedData.forEach((key, value) {
      print("key ${key} ${state.loadedData.containsKey(index - 3)}");
    });
    if (state.loadedData.containsKey(index - 3)) {
      print("second time change tab");
      emit(state.copyWith(
          selectedIndex: index - 3,
          isLoaded: true,
          isLoading: false,
          hasError: false,
          errorMessage: null,));
      try{
        print("---await1 Future.wait(");
        await Future.wait(
          List.generate(11, (index)=>getMatches(dateOffset:index-3))
          );
        print("---await2 Future.wait(");
        emit(state.copyWith(
          isLoading: false,
          isLoaded: true,
          hasError: false,
          errorMessage: null,
          dateTime: DateTime.now()));
      }catch (e){
        emit(state.copyWith(
          isLoading: false,
          isLoaded: true,
          hasError: false,
          errorMessage: null,));
      }
      
    } else {
      print("first time change tab");
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

        emit(state.copyWith(loadedData: updatedData));
      } else if (dataState is DataFailed) {
        print("has error 1");
        emit(state.copyWith(
            hasError: true,
            errorMessage: 'Failed to load data'));
        if (state.loadedData.length != 11){
          throw Exception();
        }
      }
    } catch (e) {
      print("has error 2");
      emit(state.copyWith(
          isLoading: false, hasError: true, errorMessage: e.toString()));
      if (state.loadedData.length != 11){
        throw Exception();
      }
    }
  }


  Future<String?> getMatcheDetails ({required int matchId})async{
    try{
      DataState dataState = await matchesRepository.getMatcheDetails(matchId: matchId);
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
