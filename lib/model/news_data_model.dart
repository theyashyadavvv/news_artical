import 'dart:convert';

class NewsDataModel {
  final String status;
  final List<Article> articles;

  NewsDataModel({required this.articles, required this.status});

  factory NewsDataModel.fromJson(String source) =>
      NewsDataModel.fromMap(json.decode(source));

  factory NewsDataModel.fromMap(Map<String, dynamic> map) {
    return NewsDataModel(
      status: map['status'],
      articles: List<Article>.from(
        map['articles']?.map((x) => Article.fromMap(x)) ?? [],
      ),
    );
  }
}

class Article {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String sourceName;

  Article({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.sourceName,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'] ?? '',
      description: map['description'] ?? 'No description available',
      url: map['url'] ?? '',
      urlToImage:
          map['urlToImage'] ??
          'https://community.softr.io/uploads/db9110/original/2X/7/74e6e7e382d0ff5d7773ca9a87e6f6f8817a68a6.jpeg',
      publishedAt: map['publishedAt'] ?? '',
      sourceName: map['source']['name'] ?? '',
    );
  }
}
