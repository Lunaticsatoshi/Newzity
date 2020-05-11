part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}
 //App Started
class AppStarted extends NewsEvent {}


//Refresh News
class RefreshNews extends NewsEvent {}

//Refresh Category News
class RefreshCategoryNews extends NewsEvent {
  final String category;

  RefreshCategoryNews({this.category});
}

//Load More News
class LoadMoreNews extends NewsEvent {
  final List<Article> news;
  final List<Article> topnews;

  const LoadMoreNews({this.topnews, this.news});

  @override
  List<Object> get props => [topnews, news];

  @override
  String toString() => 'LoadMoreNews { topnews: $topnews news: $news}';
}

//Load More Top News
class LoadMoreTopNews extends NewsEvent {
    final List<Article> topnews;
    final List<Article> news;

  const LoadMoreTopNews({this.topnews, this.news});

  @override
  List<Object> get props => [topnews, news];

  @override
  String toString() => 'LoadMoreTopNews { topnews: $topnews news: $news }';
}

//Load More Category News
class LoadMoreCategoryNews extends NewsEvent {
  final List<Article> categorynews;
  final String category;

  const LoadMoreCategoryNews({this.categorynews, this.category});

  @override
  List<Object> get props => [categorynews , category];

  @override
  String toString() => 'LoadMoreCategoryNews { news: $categorynews category: $category}';
}

