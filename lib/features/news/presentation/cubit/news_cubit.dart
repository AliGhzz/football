import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/trending_news.dart';
import 'package:football/features/news/data/models/world_news.dart';
import 'package:football/features/news/data/repository/trending_news_repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  TrendingNewsRepository trendingNewsRepository;
  NewsCubit(this.trendingNewsRepository) : super(NewsState(newsState: NewsLoading()));

  Future<void> getTrendingNews() async {
    try {
      DataState dataState = await trendingNewsRepository.getTrendingNews();
      print("object");
      if (dataState is DataSuccess) {
        TrendingNews trending = dataState.data;
        Logger().i("news lenght: ${trending.news}");
        emit(NewsState(newsState: NewsLoaded(trending: dataState.data)));
      } else {
        print("object ${dataState.error}");
        emit(NewsState(newsState: NewsError(errorMessage: dataState.error!)));
      }
    } catch (e) {
      print("object $e");
      emit(NewsState(newsState: NewsError(errorMessage: '$e')));
    }
  }
}
