import 'package:flutter/material.dart';
import 'package:prime_movie_app/navigation/tabbar.dart';
import 'package:prime_movie_app/utils/apptheme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    wheretogo(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: apptheme.secondaryColor,
        body: Center(
          child: Image.asset(
            "assets/Prime_logo.png",
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }

  void wheretogo(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TabBarScreen(),
        ));
  }
}
