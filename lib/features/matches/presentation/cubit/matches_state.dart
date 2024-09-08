part of 'matches_cubit.dart';

class MatchesState {
  final bool isLoading;
  final bool? isLoaded;
  final Map<int, Matches?> loadedData;
  final bool hasError;
  final String? errorMessage;
  final DateTime? dateTime ;
  MatchesState({
    this.isLoading = false,
    this.isLoaded ,
    this.loadedData = const {},
    this.hasError = false,
    this.errorMessage,
    this.dateTime
  });

  MatchesState copyWith({
    bool? isLoading,
    bool? isLoaded,
    Map<int, Matches?>? loadedData,
    bool? hasError,
    String? errorMessage,
    DateTime? dateTime,
  }) {
    return MatchesState(
        isLoading: isLoading ?? this.isLoading,
        isLoaded: isLoaded ?? this.isLoaded,
        loadedData: loadedData ?? this.loadedData,
        hasError: hasError ?? this.hasError,
        errorMessage: errorMessage ?? this.errorMessage,
        dateTime: dateTime ?? this.dateTime);
  }
}
