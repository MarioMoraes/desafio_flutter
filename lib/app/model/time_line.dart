import 'dart:convert';

class TimeLine {
  String profile;
  String picture;
  int likes;
  int comments;
  String message;
  String name;

  TimeLine({
    required this.profile,
    required this.picture,
    required this.likes,
    required this.comments,
    required this.message,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'profile': profile,
      'picture': picture,
      'likes': likes,
      'comments': comments,
      'message': message,
      'name': name,
    };
  }

  factory TimeLine.fromMap(Map<String, dynamic> map) {
    return TimeLine(
      profile: map['profile'] ?? '',
      picture: map['picture'] ?? '',
      likes: map['likes']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
      message: map['message'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TimeLine.fromJson(String source) =>
      TimeLine.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TimeLine(profile: $profile, picture: $picture, likes: $likes, comments: $comments, message: $message, name: $name)';
  }
}
