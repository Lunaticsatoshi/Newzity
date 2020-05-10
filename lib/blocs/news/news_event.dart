part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}
 //App Started
class AppStarted extends NewsEvent {}

//Navigated To Category News Page
class NavigatedToCategoryPage extends NewsEvent {
  final String category;

  NavigatedToCategoryPage({this.category});
}

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

  const LoadMoreNews({this.news});

  @override
  List<Object> get props => [news];

  @override
  String toString() => 'LoadMoreNews { news: $news}';
}

//Load More Top News
class LoadMoreTopNews extends NewsEvent {
    final List<Article> topnews;

  const LoadMoreTopNews({this.topnews});

  @override
  List<Object> get props => [topnews];

  @override
  String toString() => 'LoadMoreTopNews { topnews: $topnews}';
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

