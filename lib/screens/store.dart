import 'package:flutter/material.dart';
import 'package:prime_movie_app/services/tmdb_service.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';
import 'package:prime_movie_app/widgets/rent_carousel.dart';
import 'package:prime_movie_app/widgets/upcoming.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List trendingMovies = [];
  List upcomingMovies = [];
  final TMDBService tmdbService = TMDBService();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final trendingResult = await tmdbService.getTrendingMovies();
      final upcomingResult = await tmdbService.getUpcomingMovies();

      setState(() {
        trendingMovies = trendingResult['results'];
        upcomingMovies = upcomingResult['results'];
      });
    } catch (e) {
      print('Failed to load movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      body: SafeArea(
        child: Scaffold(
          backgroundColor: apptheme.secondaryColor,
          appBar: AppBar(
            backgroundColor: apptheme.secondaryColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                modifiedTexts(
                  text: "Store",
                  color: apptheme.StoreAppBarTitle,
                  size: 20,
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cast,
                  color: apptheme.iconColor1,
                ),
              ),
              SizedBox(width: 6),
              Image.asset(
                "assets/profile.png",
                width: 30,
                color: Colors.blue.shade600,
              ),
              SizedBox(width: 2),
            ],
          ),
          body: ListView(
            children: [
              RentMovies(rent: trendingMovies),
              SizedBox(height: 10),
              UpcomingMovies(upcoming: upcomingMovies),
            ],
          ),
        ),
      ),
    );
  }
}
