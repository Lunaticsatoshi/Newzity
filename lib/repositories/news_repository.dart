import 'dart:convert';

import 'package:newzity/models/article_model.dart';
import 'package:newzity/repositories/base_news_repository.dart';
import 'package:newzity/utilities/apikey.dart';
import 'package:http/http.dart' as http;

class NewsRepository extends BaseNewsRepository {
  static const int perPage = 100;
  final http.Client _httpClient;

  NewsRepository({http.Client httpClient}) : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Article>> getNews({int page}) async {
    List<Article> news = [];
    String requestUrl =
        "https://newsapi.org/v2/everything?domains=wsj.com,nytimes.com,bbc.com,buzzfeednews.com,edition.cnn.com,timesofindia.indiatimes.com,theguardian.com,washingtonpost.com,cnbc.com,ndtv.com,time.com,scmp.com&pageSize=$perPage&language=en&page=$page&apiKey=${apiKey}";

    try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          news.add(Article.fromJson(element));
        }
      });
      }
      return news;
    } catch (err) {
      throw err;
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
