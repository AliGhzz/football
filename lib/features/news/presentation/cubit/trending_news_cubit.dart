import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/trending_news.dart';
import 'package:football/features/news/data/repository/trending_news_repository.dart';

part 'trending_news_state.dart';

class TrendingNewsCubit extends Cubit<TrendingNewsState> {
  TrendingNewsRepository trendingNewsRepository;
  TrendingNewsCubit(this.trendingNewsRepository) : super(TrendingNewsState(isLoading: true,isLoaded: false,hasError: false));

  Future<void> getTrendingNews() async {
    try {
      DataState dataState = await trendingNewsRepository.getTrendingNews();
      if (dataState is DataSuccess) {
        emit(state.copyWith(isLoaded: true,isLoading: false,hasError: false,trendingNews: dataState.data));
      } else {
        emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error));
       
      }
    } catch (e) {
      emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e'));

    }
  }
}
