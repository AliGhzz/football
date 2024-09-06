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
import 'package:football/features/news/presentation/cubit/top_transfers/top_transfers_cubit.dart';
import 'package:football/features/news/presentation/cubit/trending_news/trending_news_cubit.dart';
import 'package:football/features/news/presentation/cubit/world_news/world_news_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MyLocationApiProvider>(MyLocationApiProvider());
  getIt.registerSingleton<MyLocationRepository>(MyLocationRepository(getIt()));
  getIt.registerSingleton<LocationCubit>(LocationCubit(getIt()));

  getIt.registerSingleton<MatchesApiProvider>(MatchesApiProvider());
  getIt.registerSingleton<MatchesRepository>(MatchesRepository(getIt()));
  getIt.registerSingleton<MatchesCubit>(MatchesCubit(getIt()));

  getIt.registerSingleton<NewsApiProvider>(NewsApiProvider());
  getIt.registerSingleton<NewsRepository>(NewsRepository(getIt()));
  getIt.registerSingleton<TrendingNewsCubit>(TrendingNewsCubit(getIt()));
  getIt.registerSingleton<WorldNewsCubit>(WorldNewsCubit(getIt()));

  getIt.registerSingleton<TransfersApiProvider>(TransfersApiProvider());
  getIt.registerSingleton<TransfersRepository>(TransfersRepository(getIt()));
  getIt.registerSingleton<TopTransfersCubit>(TopTransfersCubit(getIt()));
}
