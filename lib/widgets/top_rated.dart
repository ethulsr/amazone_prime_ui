import 'package:flutter/material.dart';
import 'package:prime_movie_app/screens/description.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class TopRatedMovies extends StatelessWidget {
  final List toprated;
  const TopRatedMovies({super.key, required this.toprated});

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
                text: "- Top Rated Movies",
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
              itemCount: toprated.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Description(
                          name: toprated[index]['title'],
                          description: toprated[index]['overview'],
                          launch_date: toprated[index]['release_date'],
                          bannerURL: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['backdrop_path'],
                          posterURL: 'https://image.tmdb.org/t/p/w500' +
                              toprated[index]['poster_path'],
                          vote: toprated[index]['vote_average'].toString(),
                          ageRestricted: toprated[index]['adult']),
                    ));
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
                                          toprated[index]['poster_path']))),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: modifiedTexts(
                              text: toprated[index]['title'] != null
                                  ? toprated[index]['title']
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
