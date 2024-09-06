part of 'trending_news_cubit.dart';

class TrendingNewsState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;
  final String? errorMessage;
  final TrendingNews? trendingNews;
  TrendingNewsState({required this.isLoading,required this.isLoaded,required this.hasError, this.errorMessage, this.trendingNews});

  TrendingNewsState copyWith ({bool? isLoading,bool? isLoaded,bool? hasError,String? errorMessage,TrendingNews? trendingNews}){
    return TrendingNewsState(
      isLoading: isLoading ?? this.isLoading, 
      isLoaded: isLoaded ?? this.isLoaded, 
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      trendingNews: trendingNews ?? this.trendingNews,
    );
  }
}
