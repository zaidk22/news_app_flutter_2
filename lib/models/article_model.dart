import 'package:flutter/foundation.dart';
import 'package:news_app/models/source_model.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  //Now let's create the constructor
  Article(
      {required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required  this.publishedAt,
        required this.content});

  // function that will map the json into a list
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] ,
      title: json['title'] ,
      description: json['description'],
      url: json['url'] ,
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] ,
      content: json['content'] ,
    );
  }
}

