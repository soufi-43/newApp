import 'package:http/http.dart' as http;
import 'package:news_app/models/post.dart';

import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/category.dart';

class PostsAPI {
  Future<List<Post>> fetchPostsByCategoryId(String id) async {
    String whatsNewApi = base_api + categories_api + id;

    var response = await http.get(whatsNewApi);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"],
            featuredImage: item["featured_image"].toString(),
            votesUp: item["votes_up"],
            votesDown: item["votes_down"],
            votersUp: (item["voters_up"]) == null
                ? List<int>()
                : jsonDecode(item["voters_up"]),
            votersDown: (item["voters_down"]) == null
                ? List<int>()
                : jsonDecode(item["voters_down"]),
            userId: item["user_id"],
            categoryId: item["category_id"]);
        posts.add(post);
      }
    }
    return posts;
  }



}
