import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/models/post.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(widget.post.featuredImage),
                  fit: BoxFit.cover,
                )),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return _drawPostDetails();
              } else if (position == 1) {
                return _commentsTitle();
              } else if (position > 1 && position < 24) {
                return _comments();
              } else {
                return _commentTextEntry();
              }
            }, childCount: 25),
          )
        ],
      ),
    );
  }

  Color getRandomColor({int mindBrightness = 50}) {
    final random = Random();
    assert(mindBrightness >= 0 && mindBrightness <= 255);
    return Color.fromARGB(
      0xFF,
      mindBrightness + random.nextInt(255 - mindBrightness),
      mindBrightness + random.nextInt(255 - mindBrightness),
      mindBrightness + random.nextInt(255 - mindBrightness),
    );
  }

  Widget _drawPostDetails() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Text(widget.post.content,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1.2,
            height: 1.25,
          )),
    );
  }

  Widget _comments() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage:
                    ExactAssetImage("assets/images/placeholder_bg.png"),
              ),
              SizedBox(
                width: 16.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Christian"),
                  Text("1 hour"),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
              "wesel the jeeper goodnes iconsiderably spelled soubiquitouq amarued knikked and alturatic amiable"),
        ],
      ),
    );
  }

  Widget _commentTextEntry() {
    return Container(
      color: Color.fromRGBO(241, 245, 247, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write Comment Here',
                    filled: true,
                    contentPadding:
                        EdgeInsets.only(left: 16, top: 24, bottom: 28),
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  "SEND",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget _commentsTitle() {
    return Container(
      padding: EdgeInsets.only(left: 15,bottom: 15,top: 20),
      child: Text("Comments : "),

    ); 
  }
}
