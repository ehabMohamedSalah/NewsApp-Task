import 'package:rootco_task/Domain_layer/entity/ArticleEntity.dart';

import 'Source_Model.dart';

/// source : {"id":"google-news","name":"Google News"}
/// author : "Toronto Star"
/// title : "News from the Star you should know about on Thursday, May 16 - Toronto Star"
/// description : null
/// url : "https://news.google.com/rss/articles/CBMipwFodHRwczovL3d3dy50aGVzdGFyLmNvbS9uZXdzL21vcm5pbmctZGlnZXN0L3RoZS1yaXNlLWFuZC1mYWxsLW9mLW9udGFyaW9zLWNyeXB0by1raW5nLWEtcG90ZW50aWFsLWN1cmUtZm9yLWFscy1vbi10aGUvYXJ0aWNsZV83YTg4YzNhMC0xMzc2LTExZWYtODNiOS0xMzZjMmFhNjgxNWUuaHRtbNIBAA?oc=5"
/// urlToImage : null
/// publishedAt : "2024-05-16T11:21:00Z"
/// content : null

class ArticlesModel {
  ArticlesModel({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  ArticlesModel.fromJson(dynamic json) {
    source = json['source'] != null ? SourceModel.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  SourceModel? source;
  String? author;
  String? title;
  dynamic description;
  String? url;
  dynamic urlToImage;
  String? publishedAt;
  dynamic content;
ArticlesModel copyWith({  SourceModel? source,
  String? author,
  String? title,
  dynamic description,
  String? url,
  dynamic urlToImage,
  String? publishedAt,
  dynamic content,
}) => ArticlesModel(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

  ArticleEntity toArticleEntity(){
    return ArticleEntity(
      title:title ,
      description:description,
      source: source?.toSourceEntity(),
      author:author ,
      content: content,
      publishedAt: publishedAt,
      url: url,
      urlToImage: urlToImage,
    );
  }
}