part of 'news_cubit.dart';

class NewsState {
  final TrendingNewsState trendingNews;
  final WorldNewsState worldNews;
  final TopTransfersState topTransfers;
  NewsState({required this.trendingNews,required this.worldNews,required this.topTransfers});

  NewsState copyWith ({TrendingNewsState? trendingNews, WorldNewsState? worldNews, TopTransfersState? topTransfers}){
    return NewsState(
      trendingNews: trendingNews ?? this.trendingNews,
      worldNews: worldNews ?? this.worldNews,
      topTransfers: topTransfers ?? this.topTransfers,
    );
  }
}


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


class WorldNewsState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;
  final String? errorMessage;
  final WorldNews? worldNews;
  WorldNewsState({required this.isLoading,required this.isLoaded,required this.hasError, this.errorMessage, this.worldNews});

  WorldNewsState copyWith ({bool? isLoading,bool? isLoaded,bool? hasError,String? errorMessage,WorldNews? worldNews}){
    return WorldNewsState(
      isLoading: isLoading ?? this.isLoading, 
      isLoaded: isLoaded ?? this.isLoaded, 
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      worldNews: worldNews ?? this.worldNews,
    );
  }
}



class TopTransfersState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;
  final String? errorMessage;
  final TopTransfers? topTransfers;
  TopTransfersState({required this.isLoading,required this.isLoaded,required this.hasError, this.errorMessage, this.topTransfers});

  TopTransfersState copyWith ({bool? isLoading,bool? isLoaded,bool? hasError,String? errorMessage,TopTransfers? topTransfers}){
    return TopTransfersState(
      isLoading: isLoading ?? this.isLoading, 
      isLoaded: isLoaded ?? this.isLoaded, 
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      topTransfers: topTransfers ?? this.topTransfers,
    );
  }
}