part of 'top_transfers_cubit.dart';

class TopTransfersState {
  final bool isLoading;
  final bool isLoaded;
  final bool hasError;
  final String? errorMessage;
  final Transfers? topTransfers;
  TopTransfersState({required this.isLoading,required this.isLoaded,required this.hasError, this.errorMessage, this.topTransfers});

  TopTransfersState copyWith ({bool? isLoading,bool? isLoaded,bool? hasError,String? errorMessage,Transfers? topTransfers}){
    return TopTransfersState(
      isLoading: isLoading ?? this.isLoading, 
      isLoaded: isLoaded ?? this.isLoaded, 
      hasError: hasError ?? this.hasError,
      errorMessage: errorMessage ?? this.errorMessage,
      topTransfers: topTransfers ?? this.topTransfers,
    );
  }
}
