import 'package:flutter/material.dart';

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
