import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newzity/UI/article_screen.dart';
import 'package:newzity/models/article_model.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  const NewsTile({Key key, this.article}) : super(key: key);

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
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Container(
          margin: EdgeInsets.all(8.0),
          height: 155.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 2.0,
                ),
                Container(
                  height: 120.0,
                  width: 120.0,
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: article.urlToImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: 100.0,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 4.0),
                            child: Text(
                              "Read Now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monteserrat"),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        article.title ?? " ",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Monteserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 14.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
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
                            width: 44.0,
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
