import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzity/UI/web_screen.dart';
import 'package:newzity/models/article_model.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;
  ArticleScreen({Key key, this.article}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen>
    with AutomaticKeepAliveClientMixin {
  var ispressed = true;
  bool keepAlive = false;

  @override
  void initState() {
    super.initState();
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
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              //Main Image
              Container(
                height: height / 2,
                child: CachedNetworkImage(
                  imageUrl: widget.article.urlToImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                height: height / 2,
                color: Colors.black26,
              ),
              //Top Navigation Widgets
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: (ispressed)
                          ? Icon(
                              Icons.bookmark_border,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.bookmark,
                              color: Colors.red,
                            ),
                      onPressed: () {
                        setState(() {
                          if (ispressed == true) {
                            ispressed = false;
                          } else {
                            ispressed = true;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
              //Bottom Content Widget
              Container(
                margin: EdgeInsets.only(top: height / 2.3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: height / 18.0),
                    width: width,
                    child: Padding(
                      padding: EdgeInsets.all(19.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          //Title
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      widget.article.title ?? " ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30.0,
                                        fontFamily: "Monteserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          //Time
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd - kk:mm')
                                    .format(widget.article.publishedAt ?? ""),
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.grey),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //Author
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/bluesky.jpg"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.article.author ?? " ",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontFamily: "Monteserrat",
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.article.description ?? " ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 21.0,
                              fontFamily: "Monteserrat",
                              height: 1.5,
                            ),
                            textAlign: TextAlign.left,
                            maxLines: 4,
                            overflow: TextOverflow.fade,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context, MaterialPageRoute(
                              builder: (_) => WebScreen(postUrl: widget.article.articleUrl ?? " ")
                              )
                            ),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 6.0),
                                  child: Text(
                                    "Read Full",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Monteserrat"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => keepAlive;
}
