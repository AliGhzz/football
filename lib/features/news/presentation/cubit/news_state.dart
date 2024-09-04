part of 'news_cubit.dart';

class NewsState {
  AllState newsState;
  NewsState({required this.newsState});
}

abstract class AllState {}

class NewsLoading extends AllState {}

class NewsLoaded extends AllState {
  final TrendingNews trending;
  NewsLoaded({required this.trending});


}

class NewsError extends AllState {
  String errorMessage;
  NewsError({required this.errorMessage});
}
