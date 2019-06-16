import 'package:flutter/material.dart';
import 'package:news_app/api/posts_api.dart';
import 'dart:async';

import 'package:news_app/models/post.dart';
import 'package:timeago/timeago.dart' as timeago;

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostsAPI postsAPI = PostsAPI();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawHeader(),
          _drawTopStories(),
          _drawRecentUpdates(),
        ],
      ),
    );
  }

  Widget _drawHeader() {
    TextStyle _headerTitle = TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescription = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/placeholder_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 48, right: 48),
                child: Text(
                  "How Terriers & Royals Gateecrashed Final",
                  style: _headerTitle,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34, right: 34),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                  style: _headerDescription,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }

  Widget _drawTopStories() {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: _drawSectionTitle('Top Stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.fetchWhatsNew(),
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return _loading();
                      break;
                    case ConnectionState.active:
                      return _loading();
                      break;
                    case ConnectionState.none:
                      // to do hundle erreor
                      return _connectionError();
                      break;
                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        //to handle error
                        return _error(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<Post> posts = snapshot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          } else {
                            return _noDtata();
                          }
                        } else {
                          return _noDtata();
                          //to do handle no data
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdates() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: postsAPI.fetchRecentUpdates(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return _connectionError();
              break;
            case ConnectionState.active:
              return _loading();
              break;
            case ConnectionState.waiting:
              return _loading();
              break;
            case ConnectionState.done:
              if (snapshot.hasError) {
                return _error(snapshot.error);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 18, bottom: 8, top: 8),
                      child: _drawSectionTitle("Recent Updates"),
                    ),
                    _drawRecentUpdatesCards(Colors.deepOrange,snapshot.data[0]),
                    _drawRecentUpdatesCards(Colors.teal,snapshot.data[1]),
                    SizedBox(
                      height: 48,
                    ),
                  ],
                );
              }

              break;
          }
        },
      ),
    );
  }

  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Image.network(
              post.featuredImage,
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
                  post.title,
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
                        Text(_parseHumanDateTime(post.dateWritten)),
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

  String _parseHumanDateTime(String dateTime) {
    Duration timeAgo = DateTime.now().difference(DateTime.parse(dateTime));
    DateTime theDifference = DateTime.now().subtract(timeAgo);
    return timeago.format(theDifference);
  }

  Widget _drawDivider() {
    return Container(
      height: 1,
      color: Colors.grey.shade100,
      width: double.infinity,
    );
  }

  Widget _drawSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w600,
          fontSize: 16),
    );
  }

  Widget _drawRecentUpdatesCards(Color color, Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(post.featuredImage),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "SPORT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 8,
            ),
            child: Text(
              post.title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 18,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  _parseHumanDateTime(post.dateWritten),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loading() {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _connectionError() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text("connection error"),
    );
  }

  Widget _error(var error) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(error.toString()),
    );
  }

  Widget _noDtata() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text("No Data Available"),
    );
  }
}
