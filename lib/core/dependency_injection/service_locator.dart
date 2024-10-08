import 'package:football/config/languages/bloc/translations_bloc.dart';
import 'package:football/config/themes/cubit/theme_switcher_cubit.dart';
import 'package:football/core/cubit/screen_index_cubit.dart';
import 'package:football/features/leagues/data/data_source/remote/leagues_info_api_provider.dart';
import 'package:football/features/leagues/data/repository/leagues_info_repository.dart';
import 'package:football/features/leagues/presentation/cubit/leagues_cubit.dart';
import 'package:football/features/matches/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/matches/data/data_source/remote/my_location_api_provider.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/data/repository/my_location_repository.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/news/data/data_source/remote/news_api_provider.dart';
import 'package:football/features/news/data/data_source/remote/transfers_api_provider.dart';
import 'package:football/features/news/data/repository/news_repository.dart';
import 'package:football/features/news/data/repository/transfers_repository.dart';
import 'package:football/features/news/presentation/cubit/news_cubit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<TranslationsBloc>(TranslationsBloc());

  getIt.registerSingleton<ThemeSwitcherCubit>(ThemeSwitcherCubit());

  getIt.registerSingleton<ScreenIndexCubit>(ScreenIndexCubit());

  getIt.registerSingleton<LeaguesInfoApiProvider>(LeaguesInfoApiProvider());
  getIt.registerSingleton<LeaguesInfoRepository>(LeaguesInfoRepository(getIt()));
  getIt.registerSingleton<LeaguesCubit>(LeaguesCubit(getIt()));

  getIt.registerSingleton<MyLocationApiProvider>(MyLocationApiProvider());
  getIt.registerSingleton<MyLocationRepository>(MyLocationRepository(getIt()));
  getIt.registerSingleton<LocationCubit>(LocationCubit(getIt()));

  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());
  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));
  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

  getIt.registerSingleton<NewsApiProvider>(NewsApiProvider());
  getIt.registerSingleton<NewsRepository>(NewsRepository(getIt()));
  getIt.registerSingleton<TransfersApiProvider>(TransfersApiProvider());
  getIt.registerSingleton<TransfersRepository>(TransfersRepository(getIt()));
  getIt.registerSingleton<NewsCubit>(NewsCubit(getIt(),getIt()));
}
