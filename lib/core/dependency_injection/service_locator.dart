import 'package:football/features/matches/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/matches/data/data_source/remote/my_location_api_provider.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/data/repository/my_location_repository.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {

  getIt.registerSingleton<MyLocationApiProvider>(MyLocationApiProvider());
  getIt.registerSingleton<MyLocationRepository>(MyLocationRepository(getIt()));
  getIt.registerSingleton<LocationCubit>(LocationCubit(getIt()));

  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());
  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));
  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

}