import 'package:football/features/matches/data/data_source/remote/matches_api_provider.dart';
import 'package:football/features/matches/data/data_source/remote/my_location_api_provider.dart';
import 'package:football/features/matches/data/repository/matches_repository.dart';
import 'package:football/features/matches/data/repository/my_location_repository.dart';
import 'package:football/features/matches/presentation/cubit/location_cubit.dart';
import 'package:football/features/matches/presentation/cubit/matches_cubit.dart';
import 'package:football/features/news/data/data_source/remote/trending_news_api_provider.dart';
import 'package:football/features/news/data/data_source/remote/world_news_api_provider.dart';
import 'package:football/features/news/data/repository/trending_news_repository.dart';
import 'package:football/features/news/data/repository/world_news_repository.dart';
import 'package:football/features/news/presentation/cubit/trending_news_cubit.dart';
import 'package:football/features/news/presentation/cubit/world_news_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MyLocationApiProvider>(MyLocationApiProvider());
  getIt.registerSingleton<MyLocationRepository>(MyLocationRepository(getIt()));
  getIt.registerSingleton<LocationCubit>(LocationCubit(getIt()));

  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());
  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));
  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

  getIt.registerSingleton<TrendingNewsApiProvider>(TrendingNewsApiProvider());
  getIt.registerSingleton<TrendingNewsRepository>(TrendingNewsRepository(getIt()));
  getIt.registerSingleton<TrendingNewsCubit>(TrendingNewsCubit(getIt()));

  getIt.registerSingleton<WorldNewsApiProvider>(WorldNewsApiProvider());
  getIt.registerSingleton<WorldNewsRepository>(WorldNewsRepository(getIt()));
  getIt.registerSingleton<WorldNewsCubit>(WorldNewsCubit(getIt()));
}
