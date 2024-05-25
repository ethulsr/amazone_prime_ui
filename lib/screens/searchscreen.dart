import 'package:flutter/material.dart';
import 'package:prime_movie_app/utils/apptheme.dart';
import 'package:prime_movie_app/utils/text.dart';

class SearchScreen extends StatelessWidget {
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
                text: "Search", color: apptheme.StoreAppBarTitle, size: 20),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: 'Search by actor, title...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Genres',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: (3 / 1),
                children: [
                  GenreButton('Action and adventure'),
                  GenreButton('Anime'),
                  GenreButton('Comedy'),
                  GenreButton('Documentary'),
                  GenreButton('Drama'),
                  GenreButton('Fantasy'),
                ],
              ),
            ),
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
            SizedBox(height: 20),
            Text(
              'Featured collections',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CollectionItem('Hindi', textcolor: Colors.white),
                  CollectionItem('English', textcolor: Colors.white),
                  CollectionItem('Telugu', textcolor: Colors.white),
                  CollectionItem('Tamil', textcolor: Colors.white),
                  CollectionItem('Malayalam', textcolor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenreButton extends StatelessWidget {
  final String genre;
  GenreButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[850],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(genre),
    );
  }
}

class CollectionItem extends StatelessWidget {
  final String collection;
  final Color textColor;

  CollectionItem(this.collection,
      {this.textColor = Colors.white, required Color textcolor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        collection,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: textColor,
      ),
      onTap: () {},
    );
  }
}
