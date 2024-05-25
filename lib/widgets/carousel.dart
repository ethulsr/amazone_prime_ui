import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class MovieCarousel extends StatelessWidget {
  final List images;
  const MovieCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: images.map((e) {
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
                                    'https://image.tmdb.org/t/p/w500${e['backdrop_path']}'))),
                      )),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          child: Row(
                            children: [
                              Icon(
                                Icons.verified,
                                color: Colors.blue.shade600,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              modifiedTexts(
                                  text: "Included with Prime",
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
          options: CarouselOptions(height: 200, autoPlay: true)),
    );
  }
}
