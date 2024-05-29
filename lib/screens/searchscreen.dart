import 'package:flutter/material.dart';
import 'package:prime_movie_app/functions/genre_and_collection.dart';
import 'package:prime_movie_app/functions/searchBarFunc.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: apptheme.secondaryColor,
      appBar: AppBar(
        backgroundColor: apptheme.secondaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            modifiedTexts(
              text: "Search",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBarFunc(),
              SizedBox(height: 10),
              Text(
                'Genres',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: (3 / 1),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GenreButton('Action and adventure'),
                  GenreButton('Anime'),
                  GenreButton('Comedy'),
                  GenreButton('Documentary'),
                  GenreButton('Drama'),
                  GenreButton('Fantasy'),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Material(
                    color: Colors.grey,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 40,
                        child: Center(
                          child: Text(
                            'See more',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Featured collections',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CollectionItem('Hindi', textcolor: Colors.white),
                  CollectionItem('English', textcolor: Colors.white),
                  CollectionItem('Telugu', textcolor: Colors.white),
                  CollectionItem('Tamil', textcolor: Colors.white),
                  CollectionItem('Malayalam', textcolor: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
