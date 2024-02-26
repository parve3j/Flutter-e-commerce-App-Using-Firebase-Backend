import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  ThemeData lightTheme(context)=> ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFBFBFD).withOpacity(0.98),
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(),
    tabBarTheme: const TabBarTheme(),
    textTheme: GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black
    )
  );
  ThemeData darkTheme(context)=>ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(),
    tabBarTheme: TabBarTheme(),
    textTheme: GoogleFonts.alefTextTheme(
      Theme.of(context).textTheme.apply(
        bodyColor: Colors.white
      )
    ),
    iconTheme: const IconThemeData(
      color: Colors.white
    )
  );
}