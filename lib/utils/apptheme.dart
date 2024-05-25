import 'package:flutter/material.dart';

AppTheme apptheme = AppDefaultTheme();

abstract class AppTheme {
  final Color primaryColor;
  final Color secondaryColor;
  final Color iconColor1;
  final Color bottomNavBarIconsColor;
  final Color terinaryColor;
  final Color searchBarColor;
  final Color StoreAppBarTitle;
  final TextStyle AppBarTitle;
  final TextStyle bottomNavBarLabel;
  final TextStyle hintTextStyle;
  final TextStyle searchTextStyle;


  AppTheme({
    required this.primaryColor, 
    required this.secondaryColor,
    required this.iconColor1,
    required this.bottomNavBarIconsColor,
    required this.terinaryColor,
    required this.searchBarColor,
    required this.StoreAppBarTitle,
    required this.AppBarTitle,
    required this.bottomNavBarLabel,
    required this.hintTextStyle,
    required this.searchTextStyle
  
  });
}

class AppDefaultTheme extends AppTheme {
  AppDefaultTheme()
      : super(
        primaryColor: Colors.white, 
        secondaryColor: Colors.black,
        iconColor1: Colors.grey.shade600,
        bottomNavBarIconsColor: Colors.white,
        terinaryColor: Colors.grey.shade800,
        searchBarColor: Colors.grey.shade900,
        StoreAppBarTitle: Colors.yellow.shade600,
        AppBarTitle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        bottomNavBarLabel: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        hintTextStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
        searchTextStyle: TextStyle(color: Colors.white, fontSize: 16)
      );
}
