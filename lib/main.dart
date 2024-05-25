import 'package:flutter/material.dart';
import 'package:prime_movie_app/screens/splash.dart';
import 'package:prime_movie_app/utils/apptheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: apptheme.secondaryColor,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: apptheme.bottomNavBarLabel,
              selectedItemColor: apptheme.primaryColor,
              unselectedItemColor: apptheme.iconColor1,
              unselectedIconTheme: IconThemeData(color: apptheme.iconColor1))),
      home: SplashScreen(),
    );
  }
}
