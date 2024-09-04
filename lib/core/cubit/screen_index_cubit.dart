import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenIndexCubit extends Cubit<int> {
  ScreenIndexCubit() : super(0);

  void changeScreen(int index) {
    emit(index);
  }
}
