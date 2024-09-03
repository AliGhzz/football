import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/trending.dart';
import 'package:football/features/news/data/repository/news_repository.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsState(newsState: NewsLoading()));

  Future<void> getNews()async{
    try{
      DataState dataState = await newsRepository.getNews();
      print("object");
      if (dataState is DataSuccess){
        Trending trending = dataState.data;
        Logger().i("news lenght: ${trending.news}");
        emit(NewsState(newsState: NewsLoaded(trending: dataState.data)));
      }else{
        print("object ${dataState.error}");
        emit(NewsState(newsState: NewsError(errorMessage:dataState.error!)));
      }
    }catch (e){
      print("object $e");
      emit(NewsState(newsState: NewsError(errorMessage:'$e')));
    }
  }
}
