import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newzity/UI/home_screen.dart';
import 'package:newzity/blocs/news/news_bloc.dart';
import 'package:newzity/repositories/categorynews_repository.dart';
import 'package:newzity/repositories/news_repository.dart';
import 'package:newzity/repositories/topnews_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (_) => NewsBloc(
          newsRepository: NewsRepository(),
          topNewsRepository: TopNewsRepository(),
          categoryNewsRepository: CategoryNewsRepository())
        ..add(AppStarted()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Newzity',
        theme: ThemeData(
          primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                color: Colors.black,
              ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
