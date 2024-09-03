part of 'news_cubit.dart';

sealed class NewsState {
}

class NewsLoading extends NewsState {
}

class NewsLoaded extends NewsState {
  Trending trending;
  NewsLoaded({required this.trending}); 
}

class NewsError extends NewsState {
  String errorMessage;
  NewsError({required this.errorMessage});
}

