import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:newsmaser/model/article_model.dart';
import '../constants.dart';

class ModelController {
  Future<List<Article>> getTopHeadlinesByCategory(String category) async {
    final String _topHeadlinesUrl =
        '${KBaseUrl}country=eg&category=$category&apiKey=$KApiKey';
    http.Response response = await http.get(_topHeadlinesUrl);
    List<Article> _articles = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['articles'];
      for (var article in data) {
        _articles.add(
          Article.fromJson(article),
        );
      }
    } else {
      throw Exception('Server Exception');
    }
    return _articles;
  }
}
