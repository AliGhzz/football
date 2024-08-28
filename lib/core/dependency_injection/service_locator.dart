import 'package:football/features/matches/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());

  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));

  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

}