import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/matches/data/models/my_location/location.dart';
import 'package:football/features/matches/data/repository/my_location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  MyLocationRepository myLocationRepository;
  LocationCubit(this.myLocationRepository)
      : super(LocationState(
            location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
  void getLocation() async {
    try {
      // print("bloc try { getLocation");
      DataState dataState = await myLocationRepository.getMyLocation();
      if (dataState is DataSuccess) {
        // print("bloc if (dataState is DataSuccess) { getLocation");
        emit(LocationState(location: dataState.data));
      } else {
        // print("bloc } else { getLocation");
        emit(LocationState(
            location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
      }
    } catch (e) {
      // print("bloc } catch (e) { getLocation");
      emit(LocationState(
          location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
    }
  }
}
