import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';
import 'package:prime_movie_app/widgets/rent_carousel.dart';
import 'package:prime_movie_app/widgets/upcoming.dart';
import 'package:tmdb_api/tmdb_api.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  List trendingmovies = [];
  List upcomingmovies = [];

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
    Map upcomingMoviesResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingResult['results'];
      upcomingmovies = upcomingMoviesResult['results'];
    });
    print("\n-----upcoming-----");
    print(upcomingmovies);
  }

  @override
  void initState() {
    loadmovies();
    super.initState();
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
                      size: 20),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cast,
                      color: apptheme.iconColor1,
                    )),
                SizedBox(
                  width: 6,
                ),
                Image.asset(
                  "assets/profile.png",
                  width: 30,
                  color: Colors.blue.shade600,
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
            body: ListView(
              children: [
                RentMovies(rent: trendingmovies),
                SizedBox(
                  height: 10,
                ),
                UpcomingMovies(upcoming: upcomingmovies),
              ],
            ),
          ),
        ));
  }
}
