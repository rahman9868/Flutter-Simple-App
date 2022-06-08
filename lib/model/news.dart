
import 'package:floor/floor.dart';

@entity
class News {
  @primaryKey
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  News({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  News.fromJson(Map<String, dynamic> json)
      : id = 0,
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];
}
