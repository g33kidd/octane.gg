class NewsArticle {
  int id;
  int publish;
  DateTime date;
  String author;
  String twitter;
  String hyphenated;
  String title;
  String description;
  String image;
  String article;
  String article2;

  NewsArticle(Map<String, dynamic> json)
      : this.id = json['id'],
        this.publish = json['Publish'],
        this.date = DateTime.parse(json['Date']),
        this.author = json['Author'],
        this.twitter = json['Twitter'],
        this.hyphenated = json['hyphenated'],
        this.title = json['Title'],
        this.description = json['Description'],
        this.image = json['Image'],
        this.article = json['Article'],
        this.article2 = json['Article2'];
}
