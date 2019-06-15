import 'dart:math';

import 'package:flutter/material.dart';


class Popular extends StatefulWidget {

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<Color> colorsList = [
    Colors.grey,
    Colors.red,
    Colors.indigo,
    Colors.deepOrange,
    Colors.brown,
    Colors.purple,
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colorsList[random.nextInt(colorsList.length)];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  _authorRow(),
                  SizedBox(
                    height: 16.0,
                  ),
                  _newsItemRow(),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage("assets/images/placeholder_bg.png"),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 16.0),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Michael Adams",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "15 Min .",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Life Style",
                      style: TextStyle(
                        color: _getRandomColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {},
          color: Colors.grey,
        )
      ],
    );
  }

  Widget _newsItemRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage("assets/images/placeholder_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: 124,
          height: 124,
          margin: EdgeInsets.only(right: 16.0),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text(
                "tech Tent;old phones and safe social",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "we also talk about the future of work as the robots advance ,and we ask wether a retro phone ",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
