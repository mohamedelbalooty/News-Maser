class Article {
  final Source source;
  final String newsTitle,
      newsDescription,
      newsURL,
      newsUrlToImage,
      newsPublishedAt;

  Article({
    this.source,
    this.newsTitle,
    this.newsDescription,
    this.newsURL,
    this.newsUrlToImage,
    this.newsPublishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
        source: jsonData['source'] != null
            ? new Source.fromJson(jsonData['source'])
            : null,
        newsTitle: jsonData['title'],
        newsDescription: jsonData['description'],
        newsURL: jsonData['url'],
        newsUrlToImage: jsonData['urlToImage'],
        newsPublishedAt: jsonData['publishedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['title'] = this.newsTitle;
    data['description'] = this.newsDescription;
    data['url'] = this.newsURL;
    data['urlToImage'] = this.newsUrlToImage;
    data['publishedAt'] = this.newsPublishedAt;
    return data;
  }
}

class Source {
  String name;

  Source({this.name});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
