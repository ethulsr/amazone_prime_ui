import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/widgets/carousel.dart';
import 'package:prime_movie_app/widgets/popular_tv.dart';
import 'package:prime_movie_app/widgets/top_rated.dart';
import 'package:prime_movie_app/widgets/trending.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topRatedMovies = [];
  List tvTopRated = [];
  final String apiKey = '0d57e289fc5473d610a6e8e80ac87c42';
  final String readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZDU3ZTI4OWZjNTQ3M2Q2MTBhNmU4ZTgwYWM4N2M0MiIsInN1YiI6IjY2NGVjMDA5ZThkMjJmNTAzY2JiMzIyNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.s8b1QQfNHWXfF9z__2jMhRW53sEVQ_bJGTsOia5Kvq4';

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readaccesstoken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvTopRatedResults = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingResult['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      tvTopRated = tvTopRatedResults['results'];
    });
    print(tvTopRatedResults);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
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
            MovieCarousel(images: tvTopRated),
            TV(populartv: tvTopRated),
            TopRatedMovies(toprated: topRatedMovies),
            TrendingMovies(trending: trendingmovies),
          ],
        ),
      ),
    );
  }
}
