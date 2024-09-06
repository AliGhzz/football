import 'package:bloc/bloc.dart';
import 'package:football/core/resorces/data_state.dart';
import 'package:football/features/news/data/models/transfers/transfers.dart';
import 'package:football/features/news/data/repository/transfers_repository.dart';
import 'package:meta/meta.dart';

part 'top_transfers_state.dart';

class TopTransfersCubit extends Cubit<TopTransfersState> {
  TransfersRepository transfersRepository;
  TopTransfersCubit(this.transfersRepository) : super(TopTransfersState(isLoading: true, isLoaded: false, hasError: false));

  Future<void> getTopTransfers() async {
    try {
      DataState dataState = await transfersRepository.getTopTransfers();
      if (dataState is DataSuccess) {
        emit(state.copyWith(isLoaded: true,isLoading: false,hasError: false,topTransfers: dataState.data));
      } else {
        emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage: dataState.error));
       
      }
    } catch (e) {
      emit(state.copyWith(isLoaded: false,isLoading: false,hasError: true,errorMessage:'$e'));

    }
  }
}
