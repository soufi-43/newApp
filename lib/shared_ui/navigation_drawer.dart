import 'package:flutter/material.dart';
import 'package:news_app/models/nav_menu.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/headline_news.dart';
import 'package:news_app/screens/twitter_feed.dart';
import 'package:news_app/screens/instagram_feed.dart';
import 'package:news_app/screens/facebook_feeds.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<navMenuItem> navigationMenu = [
    navMenuItem("Explore", () => HomeScreen()),
    navMenuItem("HeadLine News", () => HeadLineNews()),
    navMenuItem("Twitter Feeds", () => TwitterFeed()),
    navMenuItem("Instagram Feeds", () => InstagramFeed()),
    navMenuItem("Facebook_Feeds", () => FacebookFeeds(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 75,
          left: 24,
        ),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              navigationMenu[position].destination()));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
