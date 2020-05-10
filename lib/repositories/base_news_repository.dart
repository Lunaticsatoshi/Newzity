import 'package:newzity/models/article_model.dart';

abstract class BaseNewsRepository{
  Future<List<Article>> getNews({int page});
  void dispose();
}