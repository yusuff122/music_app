import 'package:flutter/material.dart';

class MyThemes{

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(
      secondary: Colors.grey.shade200,
      ),
      appBarTheme: AppBarTheme( backgroundColor: Colors.white),
      primaryColor: Colors.black,
      cardColor: Colors.white60,
      textTheme: TextTheme(),
      canvasColor: Colors.white38
  );

  static final darkTheme = ThemeData(
     scaffoldBackgroundColor: Colors.black,
     colorScheme: ColorScheme.dark(),
     primaryColor: Colors.white,
     cardColor: Colors.black26,
     appBarTheme: AppBarTheme( backgroundColor: Colors.black ),
     canvasColor: Colors.black38,
     
     
  );
}