import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/models/my_location/location.dart';
import 'package:football/features/matches/data/repository/my_location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  MyLocationRepository myLocationRepository;
  LocationCubit(this.myLocationRepository)
      : super(LocationState(
            location: Location(ccode3: "GER", timezone: "Europe/Berlin")));
// ccode3: "IRN", timezone: "Asia/Tehran"
  void getLocation() async {
    try {
      DataState dataState = await myLocationRepository.getMyLocation();
      if (dataState is DataSuccess) {
        emit(LocationState(location: dataState.data));
      } else {
        print("emit(LocationState( @@@@");
        emit(LocationState(
            location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
      }
    } catch (e) {
      print("emit(LocationState( eeee");
      emit(LocationState(
          location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
    }
  }
}
