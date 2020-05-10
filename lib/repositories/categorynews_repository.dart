import 'dart:convert';

import 'package:newzity/models/article_model.dart';
import 'package:newzity/repositories/base_categorynews_repository.dart';
import 'package:newzity/utilities/apikey.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class CategoryNewsRepository extends BaseCategoryNewsRepository {
  static const String _baseUrl = "https://newsapi.org";
  static const int perPage = 10;
    final http.Client _httpClient;


  CategoryNewsRepository({http.Client httpClient}) : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Article>> getCategoryNews({int page, @required String category}) async {
    List<Article> categorynews = [];
    String requestUrl =
        "$_baseUrl/v2/top-headlines?country=in&pageSize=$perPage&category=$category&sortBy=popularity&page=$page&apiKey=${apiKey}";

   try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          categorynews.add(Article.fromJson(element));
        }
      });
      }
      return categorynews;
    } catch (err) {
      
  }

}

  @override
  void dispose() {
  _httpClient.close();
  }
}
