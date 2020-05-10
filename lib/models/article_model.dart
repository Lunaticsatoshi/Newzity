import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;
  final String articleUrl;

  Article(
      {this.title,
      this.author,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.articleUrl});

  @override
  List<Object> get props => [
        title,
        author,
        description,
        urlToImage,
        publishedAt,
        content,
        articleUrl
      ];


  factory Article.fromJson(json) {
    return Article(
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] as String,
      articleUrl: json['url'] as String,
    );
  }
}
