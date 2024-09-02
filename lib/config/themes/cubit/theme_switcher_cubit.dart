import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_switcher_state.dart';

class ThemeSwitcherCubit extends HydratedCubit<ThemeSwitcherState> {
  ThemeSwitcherCubit() : super(ThemeSwitcherState(themeIndex:1,theme:"Dark",themeMode:ThemeMode.dark));

  void changeTheme (int themeIndex){
    if(themeIndex == 1){
      emit(ThemeSwitcherState(themeIndex:1,theme: "Dark",themeMode:ThemeMode.dark));
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF141414),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Color(0xFF141414)));
    }else{
      
      emit(ThemeSwitcherState(themeIndex:2,theme: "Light",themeMode:ThemeMode.light));
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white, 
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Color(0xFF1a1a1a)));
    }
  }
  
  @override
  ThemeSwitcherState? fromJson(Map<String, dynamic> json) {
    return ThemeSwitcherState(
      themeMode:  ThemeMode.values[json["themeMode"] as int], 
      theme: json["theme"], 
      themeIndex: json["themeIndex"]
    );
  }
  
  @override
  Map<String, dynamic>? toJson(ThemeSwitcherState state) {
    return {
      "theme":state.theme,
      "themeIndex":state.themeIndex,
      "themeMode":state.themeMode.index
    };
  }
}
