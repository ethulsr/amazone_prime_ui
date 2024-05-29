import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:prime_movie_app/api/apikey.dart';
import 'package:prime_movie_app/screens/description.dart';
import 'package:prime_movie_app/utils/apptheme.dart';

class SearchBarFunc extends StatefulWidget {
  const SearchBarFunc({super.key});

  @override
  State<SearchBarFunc> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarFunc> {
  List<Map<String, dynamic>> searchresult = [];

  Future<void> searchlistfunction(val) async {
    var searchurl =
        'https://api.themoviedb.org/3/search/multi?api_key=$ApiKey&query=$val';
    var searchresponse = await http.get(Uri.parse(searchurl));
    if (searchresponse.statusCode == 200) {
      var tempdata = jsonDecode(searchresponse.body);
      var searchjson = tempdata['results'];
      for (var i = 0; i < searchjson.length; i++) {
        if (searchjson[i]['title'] != null &&
            searchjson[i]['poster_path'] != null &&
            searchjson[i]['backdrop_path'] != null &&
            searchjson[i]['vote_average'] != null &&
            searchjson[i]['adult'] != null &&
            searchjson[i]['overview'] != null &&
            searchjson[i]['release_date'] != null) {
          searchresult.add({
            'title': searchjson[i]['title'],
            'poster_path': searchjson[i]['poster_path'],
            'backdrop_path': searchjson[i]['backdrop_path'],
            'vote_average': searchjson[i]['vote_average'],
            'adult': searchjson[i]['adult'],
            'overview': searchjson[i]['overview'],
            'release_date': searchjson[i]['release_date'],
          });

          if (searchresult.length > 20) {
            searchresult.removeRange(20, searchresult.length);
          }
        } else {
          print('******');
        }
      }
    }
  }

  final TextEditingController searchtext = TextEditingController();
  bool showlist = false;
  var val1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        showlist = !showlist;
      },
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, top: 30, bottom: 20, right: 10),
        child: Column(
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: apptheme.searchBarColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextField(
                style: apptheme.searchTextStyle,
                autofocus: false,
                controller: searchtext,
                onSubmitted: (value) {
                  searchresult.clear();
                  setState(() {
                    val1 = value;
                    FocusManager.instance.primaryFocus?.unfocus();
                  });
                },
                onChanged: (value) {
                  searchresult.clear();

                  setState(() {
                    val1 = value;
                  });
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            webBgColor: "#000000",
                            webPosition: "center",
                            webShowClose: true,
                            msg: "Search Cleared",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: apptheme.secondaryColor,
                            textColor: apptheme.primaryColor,
                            fontSize: 16.0);

                        setState(() {
                          searchtext.clear();
                          FocusManager.instance.primaryFocus?.unfocus();
                        });
                      },
                      icon: Icon(
                        Icons.cancel_rounded,
                        color: apptheme.primaryColor.withOpacity(0.6),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: apptheme.primaryColor.withOpacity(0.6),
                    ),
                    hintText: 'Search',
                    hintStyle: apptheme.hintTextStyle,
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            searchtext.text.length > 0
                ? FutureBuilder(
                    future: searchlistfunction(val1),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          height: 390,
                          width: 390,
                          child: ListView.builder(
                            itemCount: searchresult.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Description(
                                          name: searchresult[index]['title'],
                                          description: searchresult[index]
                                              ['overview'],
                                          launch_date: searchresult[index]
                                              ['release_date'],
                                          bannerURL:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  searchresult[index]
                                                      ['backdrop_path'],
                                          posterURL:
                                              'https://image.tmdb.org/t/p/w500' +
                                                  searchresult[index]
                                                      ['poster_path'],
                                          vote: searchresult[index]
                                                  ['vote_average']
                                              .toString(),
                                          ageRestricted: searchresult[index]
                                              ['adult'])));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 4, bottom: 4),
                                  height: 180,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: apptheme.secondaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500${searchresult[index]['poster_path']}'),
                                                fit: BoxFit.fill)),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return CircularProgressIndicator(
                          color: apptheme.primaryColor,
                        );
                      }
                    },
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
