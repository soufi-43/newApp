import 'package:flutter/material.dart';
import 'package:news_app/shared_ui/navigation_drawer.dart';

class InstagramFeed extends StatefulWidget {
  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  TextStyle _hashTagStyle = TextStyle(
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram Feeds"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _drawHeader(),
                  _drawTitle(),
                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _drawHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage:
                    ExactAssetImage("assets/images/placeholder_bg.png"),
                radius: 24,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Christina Meyers",
                  style: TextStyle(
                      color: Colors.grey.shade900,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text("Fri, 12 May 2017 * 14.38"),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {},
              color: Colors.grey.shade400,
            ),
            Transform.translate(
              offset: Offset(-12, 0),
              child: Text(
                "25",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16.0,
        bottom: 8,
      ),
      child: Text(
        "we also talk about the future of work as the robots",
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _drawHashTags() {
    return Container(
      child: Wrap(
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              "#advance",
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#advance",
              style: _hashTagStyle,
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              "#advance",
              style: _hashTagStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Image(
        image: ExactAssetImage('assets/images/placeholder_bg.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          onPressed: () {},
          child: Text("10 COMMENTS",style: _hashTagStyle,),
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("SHARE",style: _hashTagStyle,),
            ),
            FlatButton(
              onPressed: () {},
              child: Text("OPEN",style: _hashTagStyle,),
            ),
          ],
        ),
      ],
    );
  }
}
