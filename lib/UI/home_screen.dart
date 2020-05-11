import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newzity/blocs/news/news_bloc.dart';
import 'package:newzity/models/category_model.dart';
import 'package:newzity/services/data.dart';
import 'package:newzity/widgets/appbar.dart';
import 'package:newzity/widgets/category_card.dart';
import 'package:newzity/widgets/news_tile.dart';
import 'package:newzity/widgets/square_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  List<Category> categories = List<Category>();
  final _horizontalScrollController = ScrollController();
  final _verticalScrollController = ScrollController();
  bool keepAlive = false;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    _doAsyncStuff();
  }

  Future _doAsyncStuff() async {
    keepAlive = true;
    updateKeepAlive();
    //Keeping Alive

    await Future.delayed(Duration(hours: 1));

    keepAlive = false;
    updateKeepAlive();
    //Can be disposed whenever required
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: Color(0xFFEDF0F6),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
              child: _buildBody(state),
            ),
          );
        },
      ),
    );
  }

  _buildBody(NewsState state) {
    if (state is NewsLoading) {
      return Container(
        height: double.infinity,
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.red,
            size: 50.0,
          ),
        ),
      );
    } else if (state is NewsLoaded) {
      print(state.news);
      print(state.topnews);
      return RefreshIndicator(
        color: Colors.red,
        onRefresh: () async {
          context.bloc<NewsBloc>()..add(RefreshNews());
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(4.0),
            child: Column(
              children: <Widget>[
                //Category Tiles
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                  height: 100.0,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryCard(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Popular",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Monteserrat",
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFff6e6e),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 6.0),
                            child: Text(
                              "Trending",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monteserrat"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "20+ Stories",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //Square Tile
                NotificationListener<ScrollNotification>(
                  onNotification: (notification) =>
                      _onHorizontalScrollNotification(notification, state),
                  child: Container(
                    height: 300.0,
                    child: ListView.builder(
                      itemCount: state.topnews.length,
                      controller: _horizontalScrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SquareTile(
                          article: state.topnews[index],
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "For You",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Monteserrat",
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 12.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFff6e6e),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 6.0),
                            child: Text(
                              "Latest",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monteserrat"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "100+ News",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                //News Tile
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) =>
                        _onVerticalScrollNotification(notification, state),
                    child: ListView.builder(
                      itemCount: state.news.length,
                      controller: _verticalScrollController,
                      shrinkWrap: true,
                      reverse: true,
                      scrollDirection: Axis.vertical,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return NewsTile(
                          article: state.news[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else if (state is NewsError) {
      return Center(
        child: Text(
          "Ooops Seems like something Went Wrong ",
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: "Monteserrat",
            color: Colors.black,
          ),
        ),
      );
    }
  }

  bool _onHorizontalScrollNotification(
      ScrollNotification notif, NewsLoaded state) {
    if (notif is ScrollEndNotification &&
        _horizontalScrollController.position.extentAfter == 0) {
      context
          .bloc<NewsBloc>()
          .add(LoadMoreTopNews(topnews: state.topnews, news: state.news));
    }
    return false;
  }

  bool _onVerticalScrollNotification(
      ScrollNotification notif, NewsLoaded state) {
    if (notif is ScrollEndNotification &&
        _verticalScrollController.position.extentAfter == 2) {
      context
          .bloc<NewsBloc>()
          .add(LoadMoreNews(topnews: state.topnews, news: state.news));
    }
    return false;
  }

  @override
  bool get wantKeepAlive => keepAlive;
}
