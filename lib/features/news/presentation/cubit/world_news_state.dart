part of 'world_news_cubit.dart';

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
