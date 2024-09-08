import 'package:flutter/material.dart';


class LightTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Color.fromARGB(255, 209, 208, 208),
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xfff5f5f5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle:
          TextStyle(fontSize: 18, color: Color(0xFF222222), letterSpacing: 0),
    ),
    textTheme: const TextTheme(
        headlineSmall: TextStyle(
            fontSize: 14,
            color: Colors.black,
            letterSpacing: 0,
            fontWeight: FontWeight.w500),
        headlineMedium: TextStyle(
            fontSize: 16,
            color: Colors.black,
            letterSpacing: 0,
            fontWeight: FontWeight.w500),
        displaySmall: TextStyle(
            color: Color.fromARGB(255, 95, 94, 94),
            fontSize: 11,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w300),
        bodySmall: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          fontWeight: FontWeight.w300,
          letterSpacing: 0,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: Colors.black,
          letterSpacing: 0,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black,
          letterSpacing: 0,
        ),
        titleSmall: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            letterSpacing: 0,
            fontWeight: FontWeight.w300),
        titleMedium: TextStyle(
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0,
            fontWeight: FontWeight.w300),
        titleLarge: TextStyle(fontSize: 18, color: Colors.black)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: Color(0xFF222222),
        selectedIconTheme: IconThemeData(
          applyTextScaling: true,
        ),
        elevation: 0,
        unselectedItemColor: Color(0xFF9f9f9f),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed),


    tabBarTheme: const TabBarTheme(
      indicatorColor: Color(0xFF222222),
      dividerColor: Color.fromARGB(255, 203, 202, 202),
      dividerHeight: 0.5, 
      labelColor: Color(0xFF222222),
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      unselectedLabelColor: Color(0xFFa3a3a3),
      tabAlignment: TabAlignment.start,
    ),


    expansionTileTheme: ExpansionTileThemeData(
      iconColor: const Color(0xFF9f9f9f),
      collapsedIconColor: const Color(0xFF9f9f9f),
      collapsedBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),

    
    dividerTheme: const DividerThemeData(color: Color(0xfff2f2f2)),
  );
}
