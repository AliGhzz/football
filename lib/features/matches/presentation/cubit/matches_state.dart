part of 'matches_cubit.dart';

class MatchesState {
  final int selectedIndex;
  final bool isLoading;
  final Map<int, Matches?> loadedData;
  final bool hasError; 
  final String? errorMessage;
  final DateTime? dateTime; 
  MatchesState({ 
    required this.selectedIndex,
    this.isLoading = false,
    this.loadedData = const {},
    this.hasError = false,
    this.errorMessage,
    this.dateTime,
  });

  MatchesState copyWith({
    int? selectedIndex,
    bool? isLoading,
    Map<int, Matches?>? loadedData,
    bool? hasError,
    String? errorMessage,
    DateTime? dateTime,
  }) {
    return MatchesState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isLoading: isLoading ?? this.isLoading,
      loadedData: loadedData ?? this.loadedData,
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      dateTime: dateTime ?? this.dateTime
    );
  }
}
