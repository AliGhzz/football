import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark, 
    colorScheme: const ColorScheme.dark(
      surface: Color(0xFF141414),
      primaryContainer: Color(0xFF1d1d1d),
      secondaryContainer: Color.fromARGB(255, 71, 71, 71)
    ),

    scaffoldBackgroundColor: Colors.black, 

    appBarTheme:const AppBarTheme(
      backgroundColor:  Color(0xFF1a1a1a),
      titleTextStyle: TextStyle(fontSize: 18,color: Colors.white,letterSpacing: 0),
    ),
   
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontSize: 14,
        color: Colors.white,
        letterSpacing: 0,
        fontWeight: FontWeight.w500
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
        letterSpacing: 0,
        fontWeight: FontWeight.w500
      ),
      displaySmall: TextStyle(
        color: Colors.grey,
        fontSize: 11,
        fontWeight: FontWeight.bold
      ),
      displayMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w300
      ),
      bodySmall:  TextStyle( 
        color: Colors.grey,
        fontSize: 13,
        fontWeight: FontWeight.w300,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white,
        letterSpacing: 0,
      ),
      titleSmall:  TextStyle(
        color: Colors.grey, 
        fontSize: 12,
        letterSpacing: 0,
        fontWeight: FontWeight.w300
      ),
      titleMedium:  TextStyle(
        color: Colors.white,
        fontSize: 16,
        letterSpacing: 0,
        fontWeight: FontWeight.w300
      ),
      titleLarge: TextStyle(
        fontSize: 18, 
        color: Colors.white
      )
      
    ),
  
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: Color(0xFF66db72)  ,
      selectedIconTheme:  IconThemeData(
        applyTextScaling: true,
      ),
      elevation: 0,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed
    ),


    tabBarTheme: const TabBarTheme(
      indicatorColor: Colors.green,
      dividerColor: Colors.black,
      labelColor: Colors.white,
      labelPadding: EdgeInsets.symmetric(horizontal: 8),
      unselectedLabelColor: Colors.grey,
      tabAlignment: TabAlignment.start,
      
    ),

    expansionTileTheme: ExpansionTileThemeData(
      iconColor: Colors.white, 
      collapsedIconColor: Colors.white,    
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ) ,
    ),

    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        iconSize: WidgetStatePropertyAll(23),
        iconColor: WidgetStatePropertyAll(Colors.white)        
      )
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 25,
    ),

    dividerTheme: DividerThemeData(
      color: Colors.black
    ),

    
  );
}
