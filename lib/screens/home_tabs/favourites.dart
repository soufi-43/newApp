import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {


  @override


  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, position) {
      return Card(
        child:_drawSingleRow(),
      );
    },
      itemCount: 20,
    );
  }


  Widget _drawSingleRow() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image(
              image: ExactAssetImage('assets/images/placeholder_bg.png'),
              fit: BoxFit.cover,
            ),
            width: 124,
            height: 124,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  "The World Global Warming Annual Summit",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Michel Adams"),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text("15 min"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
