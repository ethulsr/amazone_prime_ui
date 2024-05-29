import 'package:flutter/material.dart';
import 'package:prime_movie_app/services/tmdb_service.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/widgets/carousel.dart';
import 'package:prime_movie_app/widgets/popular_tv.dart';
import 'package:prime_movie_app/widgets/top_rated.dart';
import 'package:prime_movie_app/widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List popularTVShows = [];
  final TMDBService tmdbService = TMDBService();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final trendingResult = await tmdbService.getTrendingMovies();
      final topRatedResult = await tmdbService.getTopRatedMovies();
      final popularTVResult = await tmdbService.getPopularTVShows();

      setState(() {
        trendingMovies = trendingResult['results'];
        topRatedMovies = topRatedResult['results'];
        popularTVShows = popularTVResult['results'];
      });
    } catch (e) {
      print('Failed to load movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: apptheme.secondaryColor,
        appBar: AppBar(
          backgroundColor: apptheme.secondaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/Prime_logo.png",
                width: 46,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.cast,
                  color: apptheme.iconColor1,
                )),
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/profile.png",
                  color: Colors.blue.shade600,
                  width: 30,
                ))
          ],
        ),
        body: ListView(
          children: [
            MovieCarousel(images: popularTVShows),
            TV(populartv: popularTVShows),
            TopRatedMovies(toprated: topRatedMovies),
            TrendingMovies(trending: trendingMovies),
          ],
        ),
      ),
    );
  }
}
