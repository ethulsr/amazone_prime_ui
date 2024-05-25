import 'package:flutter/material.dart';
import 'package:prime_movie_app/navigation/tabbar.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              Text(
                "No videos downloaded",
                style: apptheme.bottomNavBarLabel,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(apptheme.iconColor1),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))))),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabBarScreen()));
                  },
                  child: modifiedTexts(
                      text: "Find videos to download",
                      color: apptheme.primaryColor,
                      size: 18)),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  modifiedTexts(
                      text: "Auto Downloads: On • ",
                      color: apptheme.primaryColor,
                      size: 16),
                  modifiedTexts(
                      text: "Manage", color: Colors.blue.shade600, size: 16)
                ],
              )
            ],
          )),
        ],
      ),
    );
  }
}
