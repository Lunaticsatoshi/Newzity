part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
const NewsState();

  @override
  List<Object> get props => [];
}
 //Intial State
class NewsEmpty extends NewsState {}


//Loading State
class NewsLoading extends NewsState {}


//Retrieved News
class NewsLoaded extends NewsState{
  final List<Article> news;
  final List<Article> topnews;

  const NewsLoaded({this.news, this.topnews});

  @override
  List<Object> get props => [news, topnews];

  @override
  String toString() => 'NewsLoaded { news: $news topnews: $topnews }';
}



//Retrieved Category News
class CategoryNewsLoaded extends NewsState{
  final List<Article> categorynews;


  const CategoryNewsLoaded({this.categorynews});

  @override
  List<Object> get props => [categorynews];

  @override
  String toString() => 'CategoryNewsLoaded { news: $categorynews }';
}
 
//API Error
class NewsError extends NewsState {}

//API Error
class CategoryNewsError extends NewsState {}