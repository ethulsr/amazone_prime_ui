import 'package:flutter/material.dart';
import 'package:prime_movie_app/screens/description.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              modifiedTexts(
                  text: "Prime", color: Colors.blue.shade700, size: 24),
              SizedBox(
                width: 10,
              ),
              modifiedTexts(
                text: "- Trending Movies",
                size: 22,
                color: apptheme.primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => Description(
                                name: trending[index]?['title'] ?? 'No Title',
                                description: trending[index]?['overview'] ??
                                    'No Description',
                                launch_date: trending[index]?['release_date'] ??
                                    'No Date',
                                bannerURL:
                                    trending[index]?['backdrop_path'] != null
                                        ? 'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path']
                                        : 'https://via.placeholder.com/500',
                                posterURL:
                                    trending[index]?['poster_path'] != null
                                        ? 'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['poster_path']
                                        : 'https://via.placeholder.com/500',
                                vote: trending[index]?['vote_average']
                                        ?.toString() ??
                                    '0.0',
                                ageRestricted:
                                    trending[index]?['adult'] ?? false,
                              )),
                    );
                  },
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: modifiedTexts(
                              text: trending[index]['title'] != null
                                  ? trending[index]['title']
                                  : 'Loading',
                              color: apptheme.primaryColor,
                              size: 15),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
