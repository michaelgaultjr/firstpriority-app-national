class Resource {
  final String title;
  final String url;
  final String imageUrl;
  final int order;

  Resource.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        url = map['url'],
        imageUrl = map['imageUrl'],
        order = map['order'];
}
