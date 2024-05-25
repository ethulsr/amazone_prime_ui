import 'package:flutter/material.dart';
import 'package:prime_movie_app/screens/description.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class TV extends StatelessWidget {
  final List populartv;
  const TV({super.key, required this.populartv});

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
                text: "- Popular TV Shows",
                size: 22,
                color: apptheme.primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: populartv.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Description(
                          name: populartv[index]['original_name'],
                          description: populartv[index]['overview'],
                          launch_date: populartv[index]['first_air_date'],
                          bannerURL: 'https://image.tmdb.org/t/p/w500' +
                              populartv[index]['backdrop_path'],
                          posterURL: 'https://image.tmdb.org/t/p/w500' +
                              populartv[index]['poster_path'],
                          vote: populartv[index]['popularity'].toString(),
                          ageRestricted: populartv[index]['adult']),
                    ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          populartv[index]['backdrop_path']),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: modifiedTexts(
                              text: populartv[index]['original_name'] != null
                                  ? populartv[index]['original_name']
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
