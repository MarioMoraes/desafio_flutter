import 'dart:convert';

class User {
  String name;
  String url;
  bool live;
  bool favorite;

  User({
    required this.name,
    required this.url,
    required this.live,
    required this.favorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'live': live,
      'favorite': favorite,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      live: map['live'] ?? false,
      favorite: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(name: $name, url: $url, live: $live, favorite: $favorite)';
  }
}
