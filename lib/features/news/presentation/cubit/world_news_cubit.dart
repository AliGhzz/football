import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/world_news.dart';
import 'package:football/features/news/data/repository/world_news_repository.dart';

part 'world_news_state.dart';

class WorldNewsCubit extends Cubit<WorldNewsState> {
  WorldNewsRepository worldNewsRepository;
  WorldNewsCubit(this.worldNewsRepository) : super(WorldNewsState(isLoading: true,isLoaded: false,hasError: false));

  Future<void> getWorldNews() async {
    try {
      DataState dataState = await worldNewsRepository.getWorldNews();
      if (dataState is DataSuccess) {
        WorldNews worldNews = dataState.data;
        emit(state.copyWith(isLoaded: true,isLoading: false,hasError: false,worldNews: dataState.data));
      } else {
        emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error));
       
      }
    } catch (e) {
      emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e'));

    }
  }
}
