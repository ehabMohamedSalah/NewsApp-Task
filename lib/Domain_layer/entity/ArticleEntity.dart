import 'SourceEntity.dart';

/// source : {"id":"google-news","name":"Google News"}
/// author : "BNN Bloomberg"
/// title : "The Daily Chase: Canada's Crypto King arrested on fraud charges - BNN Bloomberg"
/// description : null
/// url : "https://news.google.com/rss/articles/CBMiZGh0dHBzOi8vd3d3LmJubmJsb29tYmVyZy5jYS90aGUtZGFpbHktY2hhc2UtY2FuYWRhLXMtY3J5cHRvLWtpbmctYXJyZXN0ZWQtb24tZnJhdWQtY2hhcmdlcy0xLjIwNzM4ODfSAQA?oc=5"
/// urlToImage : null
/// publishedAt : "2024-05-16T13:29:49Z"
/// content : null

class ArticleEntity {
  ArticleEntity({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});


  SourceEntity? source;
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;
}