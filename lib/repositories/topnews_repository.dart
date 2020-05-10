import 'dart:convert';

import 'package:newzity/models/article_model.dart';
import 'package:newzity/repositories/base_topnews_repository.dart';
import 'package:newzity/utilities/apikey.dart';
import 'package:http/http.dart' as http;

class TopNewsRepository extends BaseTopNewsRepository {
  static const int perPage = 10;
  final http.Client _httpClient;


  TopNewsRepository({http.Client httpClient}) : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Article>> getTopNews({int page}) async {
    List<Article> topnews = [];
    String requestUrl =
        "https://newsapi.org/v2/top-headlines?country=in&sortBy=popularity&language=en&apiKey=${apiKey}";

      try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          topnews.add(Article.fromJson(element));
        }
      });
      }
      return topnews;
    } catch (err) {
      throw err;
    }
  }

  @override
  void dispose() {

  }
}