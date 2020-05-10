import 'package:newzity/models/article_model.dart';

abstract class BaseCategoryNewsRepository{
  Future<List<Article>> getCategoryNews({int page, String category});
  void dispose();
}