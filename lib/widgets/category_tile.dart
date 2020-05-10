import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzity/UI/article_screen.dart';
import 'package:newzity/models/article_model.dart';

class CategoryTile extends StatelessWidget {
  final Article article;
  const CategoryTile({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => ArticleScreen(
                    article: article,
                  ))),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(9.0),
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 5),
                        blurRadius: 8.0),
                  ],
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(article.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            article.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Monteserrat"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            article.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontFamily: "Monteserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 8.0,
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      size: 16.0,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      DateFormat('yyyy-MM-dd - kk:mm')
                          .format(article.publishedAt ?? ""),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      width: 130.0,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ArticleScreen(
                                    article: article,
                                  ))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
