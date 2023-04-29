import 'dart:convert';
import 'package:http/http.dart';
import 'models/article_model.dart';

class ApiService {
  final endPointUrl = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=cb01e721746a46dcb8c5ccab4c77f31e");

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      print("samuel joseph");

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
