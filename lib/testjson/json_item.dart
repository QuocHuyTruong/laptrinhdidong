class Favorite {
  final int? id;
  final String? title;
  final String? url;
  Favorite({required this.id, this.title,this.url});
  Favorite.fromJson(Map<String, dynamic> json):
        id = json['id']  ,
        title = json['title'],
        url = json['url'];
  Map<String, dynamic> toJson()
  {
    return {
      'id': id,
      'title': title,
      'url': url
    };
  }
}