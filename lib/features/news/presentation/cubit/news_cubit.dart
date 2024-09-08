import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/news_models/trending_news.dart';
import 'package:football/features/news/data/models/news_models/world_news.dart';
import 'package:football/features/news/data/models/transfers/top_transfers.dart';
import 'package:football/features/news/data/repository/news_repository.dart';
import 'package:football/features/news/data/repository/transfers_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsRepository newsRepository;
  TransfersRepository transfersRepository;
  NewsCubit(this.newsRepository,this.transfersRepository) : super(
    NewsState(
      trendingNews: TrendingNewsState(isLoading: true, isLoaded: false, hasError: false),
      worldNews: WorldNewsState(isLoading: true, isLoaded: false, hasError: false),
      topTransfers: TopTransfersState(isLoading: true, isLoaded: false, hasError: false),
      )
    );

  Future<void> getTrendingNews() async {
    if(state.trendingNews.trendingNews == null){
      emit(state.copyWith(trendingNews: state.trendingNews.copyWith(isLoaded: false,isLoading: true,hasError: false)));
      try {
        DataState dataState = await newsRepository.getTrendingNews();
        if (dataState is DataSuccess) {
          emit(state.copyWith(trendingNews: state.trendingNews.copyWith(isLoaded: true,isLoading: false,hasError: false,trendingNews: dataState.data)));
        } else {
          emit(state.copyWith(trendingNews: state.trendingNews.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error)));
        }
      } catch (e) {
        emit(state.copyWith(trendingNews: state.trendingNews.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e')));
      }
    }else{
      DataState dataState = await newsRepository.getTrendingNews();
      if (dataState is DataSuccess) {
        emit(state.copyWith(trendingNews: state.trendingNews.copyWith(isLoaded: true,isLoading: false,hasError: false,trendingNews: dataState.data)));
      }
    }
  }


  Future<void> getWorldNews() async {
    if(state.worldNews.worldNews == null){
      emit(state.copyWith(worldNews: state.worldNews.copyWith(isLoaded: false,isLoading: true,hasError: false)));
      try {
        DataState dataState = await newsRepository.getWorldNews();
        if (dataState is DataSuccess) {
          emit(state.copyWith(worldNews: state.worldNews.copyWith(isLoaded: true,isLoading: false,hasError: false,worldNews: dataState.data)));
        } else {
          emit(state.copyWith(worldNews: state.worldNews.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error)));
        }
      } catch (e) {
        emit(state.copyWith(worldNews: state.worldNews.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e')));
      }
    }else{
      DataState dataState = await newsRepository.getWorldNews();
      if (dataState is DataSuccess) {
        emit(state.copyWith(worldNews: state.worldNews.copyWith(isLoaded: true,isLoading: false,hasError: false,worldNews: dataState.data)));
      }
    }
  }


  Future<void> getTopTransfers() async {
    if(state.topTransfers.topTransfers == null){
      emit(state.copyWith(topTransfers: state.topTransfers.copyWith(isLoaded: false,isLoading: true,hasError: false)));
      try {
        DataState dataState = await transfersRepository.getTopTransfers();
        if (dataState is DataSuccess) {
          emit(state.copyWith(topTransfers: state.topTransfers.copyWith(isLoaded: true,isLoading: false,hasError: false,topTransfers: dataState.data)));
        } else {
          emit(state.copyWith(topTransfers: state.topTransfers.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error)));
        }
      } catch (e) {
        emit(state.copyWith(topTransfers: state.topTransfers.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e')));
      }
    }else{
      DataState dataState = await transfersRepository.getTopTransfers();
      if (dataState is DataSuccess) {
        emit(state.copyWith(topTransfers: state.topTransfers.copyWith(isLoaded: true,isLoading: false,hasError: false,topTransfers: dataState.data)));
      }
    }
  }
}
