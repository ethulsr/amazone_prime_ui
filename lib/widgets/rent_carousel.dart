import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class RentMovies extends StatelessWidget {
  final List rent;
  const RentMovies({super.key, required this.rent});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: rent.map((e) {
            return Builder(
              builder: (context) {
                return InkWell(
                  child: Stack(
                    children: [
                      Positioned(
                          child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${e['poster_path']}'),
                                fit: BoxFit.fill)),
                      )),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            children: [
                              modifiedTexts(
                                  text: "Rent",
                                  color: apptheme.primaryColor,
                                  size: 16),
                            ],
                          ))
                    ],
                  ),
                );
              },
            );
          }).toList(),
          options: CarouselOptions(height: 400, autoPlay: true)),
      // ignore: dead_code
    );
    // ignore: dead_code
    ;
  }
}
