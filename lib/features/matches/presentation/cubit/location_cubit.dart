import 'package:bloc/bloc.dart';
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
      DataState dataState = await myLocationRepository.getMyLocation();
      if (dataState is DataSuccess) {
        emit(LocationState(location: dataState.data));
      } else {
        emit(LocationState(
            location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
      }
    } catch (e) {
      emit(LocationState(
          location: Location(ccode3: "IRN", timezone: "Asia/Tehran")));
    }
  }
}
