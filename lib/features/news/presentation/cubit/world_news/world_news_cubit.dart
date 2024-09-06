import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/news_models/world_news.dart';
import 'package:football/features/news/data/repository/news_repository.dart';

part 'world_news_state.dart';

class WorldNewsCubit extends Cubit<WorldNewsState> {
  NewsRepository newsRepository;
  WorldNewsCubit(this.newsRepository) : super(WorldNewsState(isLoading: true,isLoaded: false,hasError: false));

  Future<void> getWorldNews() async {
    try {
      DataState dataState = await newsRepository.getWorldNews();
      if (dataState is DataSuccess) {
        emit(state.copyWith(isLoaded: true,isLoading: false,hasError: false,worldNews: dataState.data));
      } else {
        emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error));
       
      }
    } catch (e) {
      emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e'));

    }
  }
}
