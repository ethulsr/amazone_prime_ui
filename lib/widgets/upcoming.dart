import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  const UpcomingMovies({super.key, required this.upcoming});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                modifiedTexts(
                    text: "Upcoming Releases",
                    color: apptheme.StoreAppBarTitle,
                    size: 22)
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcoming.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
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
                                            upcoming[index]['poster_path']))),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: modifiedTexts(
                                text: upcoming[index]['original_title'] != null
                                    ? upcoming[index]['original_title']
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
      ),
    );
  }
}
