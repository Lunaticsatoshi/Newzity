import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newzity/models/article_model.dart';
import 'package:newzity/repositories/categorynews_repository.dart';
import 'package:newzity/repositories/news_repository.dart';
import 'package:newzity/repositories/topnews_repository.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository;
  final TopNewsRepository _topNewsRepository;
  final CategoryNewsRepository _categoryNewsRepository;

  NewsBloc({@required NewsRepository newsRepository, @required TopNewsRepository topNewsRepository, @required CategoryNewsRepository categoryNewsRepository})
            : assert(newsRepository != null && topNewsRepository != null && categoryNewsRepository != null), 
                  _newsRepository = newsRepository, _topNewsRepository = topNewsRepository, _categoryNewsRepository = categoryNewsRepository;

  @override
  NewsState get initialState => NewsEmpty();

  @override
  Stream<NewsState> mapEventToState( NewsEvent event) async* {
     if (event is AppStarted){
       yield* _mapAppStartedToState();
     }else if (event is RefreshNews){
       yield* _getNews(news: []);
       yield* _getTopNews(topnews: []);
     }else if (event is LoadMoreNews){
       yield* _mapLoadMoreNewsToState(event);
     }else if (event is LoadMoreTopNews){
      yield* _mapLoadMoreTopNewsToState(event);
     }else if (event is NavigatedToCategoryPage){
       yield* _mapNavigatedToCategoryPageToState(event.category);
     }else if (event is RefreshCategoryNews){
       yield* _getCategoryNews(categorynews: [], category: event.category);
     }else if (event is LoadMoreCategoryNews){
       yield* _mapLoadMoreCategoryNewsToState(event);
     }
  }
     
     Stream<NewsState> _mapAppStartedToState() async* {
       yield NewsLoading();
       yield* _getNews(news: []);
       yield* _getTopNews(topnews: []);
     }

     Stream<NewsState> _mapNavigatedToCategoryPageToState(String category) async*{
       yield CategoryNewsLoading();
       yield* _getCategoryNews(categorynews: [], category:category);
     }

   Stream<NewsState> _getNews({List<Article> news, int page = 0}) async* {
      //Request for News
      try {
        List<Article> newNewsList = news + await _newsRepository.getNews(page: page);
        yield NewsLoaded(news: newNewsList);
      }catch (err){
        yield NewsError();
      }
   }

   Stream<NewsState> _getTopNews({List<Article> topnews, int page = 0}) async* {
     //Request For Top News
     try{
        List<Article> newTopNewsList = topnews + await _topNewsRepository.getTopNews(page: page);
        yield NewsLoaded(topnews: newTopNewsList);
     }catch (err) {
       yield NewsError();
     }
   }

   Stream _getCategoryNews({List<Article> categorynews, int page = 0, @required String category}) async*{
    //Request For Category news
    try{
       List<Article> newCategoryNewsList = categorynews + await _categoryNewsRepository.getCategoryNews(page: page, category: category);
       yield CategoryNewsLoaded(categorynews: newCategoryNewsList);
    }catch (err){
      yield CategoryNewsError();
    }
   }

   Stream<NewsState> _mapLoadMoreNewsToState(LoadMoreNews event) async*{
    final int nextPage = event.news.length ~/ NewsRepository.perPage;
    yield* _getNews(news: event.news, page: nextPage);
   }

   Stream<NewsState> _mapLoadMoreTopNewsToState(LoadMoreTopNews event) async*{
    final int nextTopPage = event.topnews.length ~/ TopNewsRepository.perPage;
    yield* _getTopNews(topnews: event.topnews, page: nextTopPage);
   }
   
   Stream<NewsState> _mapLoadMoreCategoryNewsToState(LoadMoreCategoryNews event) async* {
     final int nextCategoryPage = event.categorynews.length ~/ CategoryNewsRepository.perPage;
     yield* _getCategoryNews(categorynews: event.categorynews, page: nextCategoryPage, category: event.category);
   }
}
