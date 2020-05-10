import 'package:newzity/models/article_model.dart';

abstract class BaseTopNewsRepository{
  Future<List<Article>> getTopNews({int page});
  void dispose();
}