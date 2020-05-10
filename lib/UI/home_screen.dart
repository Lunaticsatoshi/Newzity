import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newzity/blocs/news/news_bloc.dart';
import 'package:newzity/widgets/appbar.dart';
import 'package:newzity/widgets/square_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newslist;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
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
    if (state is NewsLoading && state is NewsEmpty ) {
            return Container(
              child: Center(
                child: SpinKitFoldingCube(
                  color: Colors.red,
                  size: 50.0,
                ),
              ),
            );
          } else if (state is NewsLoaded) {
            print(state.news);
            return Container(
              margin: EdgeInsets.all(4.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 320.0,
                    child: ListView.builder(
                      itemCount: newslist.length,
                      controller: _scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return SquareTile(
                          article: state.news[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NewsError ) {
            return Container(
              child: Center(
                child: Text(
                  "Ooops Seems like something Went Wrong ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: "Monteserrat",
                    color: Colors.black,
                  ),
                ),
              ),
            );
          }
  }
}
