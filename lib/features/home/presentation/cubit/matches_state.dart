part of 'matches_cubit.dart';

abstract class MatchesState {}



class MatchesLoading extends MatchesState{}
class MatchesLoaded extends MatchesState{
  Matches matches;
  MatchesLoaded({required this.matches});
}
class MatchesError extends MatchesState{
  String error;
  MatchesError({required this.error});
}
