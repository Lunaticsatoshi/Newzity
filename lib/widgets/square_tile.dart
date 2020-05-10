import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:newzity/UI/article_screen.dart';
import 'package:newzity/models/article_model.dart';

class SquareTile extends StatelessWidget {
  final Article article;
  const SquareTile({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(
        builder: (_) => ArticleScreen(
          article: article,
        )
        )
        ),
      child: Container(
        margin: EdgeInsets.only(right: 30.0),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [BoxShadow(
                    color: Colors.black45, 
                    offset: Offset(0, 2), 
                    blurRadius: 6.0,)
                    ],
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                child: CachedNetworkImage(
                imageUrl: article.urlToImage,
                height: 300.0,
                width: 300.0,
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(25.0),
            ),
              Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.black26
                ),
                child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Stack(
                             alignment: Alignment.topRight,
                             children: <Widget>[
                               Icon(
                                 Icons.bookmark_border,
                                 color: Colors.white,
                                 size: 28.0,
                               ),
                             ], 
                            ), 
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: <Widget>[
                            Text(
                              article.title ?? " ",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontFamily: "Monteserrat",
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.fade,
                            ),
                          ],
                        ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Text(
                                article.author ?? " ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Monteserrat",
                                ),                       
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Icon(Icons.access_time, size: 16.0, color: Colors.white,),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    DateFormat('yyyy-MM-dd - kk:mm').format(article.publishedAt ?? ""),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}