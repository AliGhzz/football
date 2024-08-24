import 'package:football/features/home/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/home/data/repository/matches_repository.dart';
import 'package:football/features/home/presentation/cubit/matches_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());

  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));

  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

}