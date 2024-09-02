import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'translations_event.dart';
part 'translations_state.dart';

class TranslationsBloc extends HydratedBloc<TranslationsEvent, TranslationsState> {
  TranslationsBloc() : super(TranslationsState(2, "English",const Locale("en"))) {
   
    on<TranslationsEvent>((event, emit) {
      if (event.language == "fa") {
        emit(TranslationsState(1, "Persian",const Locale("fa")));
      } else {
        emit(TranslationsState(2, "English",const Locale("en")));
      }
    });
  }

  @override
  TranslationsState? fromJson(Map<String, dynamic> json) {

    return TranslationsState.fromJson(json);
  } 

  @override
  Map<String, dynamic>? toJson(TranslationsState state) {
    return state.toJson();
  }
}


