import 'package:news_app/features/domain/entities/story.dart';

class StoryModel extends Story {
  StoryModel({
    required int id,
    required String by,
    required String title,
    required int score,
    required List<dynamic> kids,
    String? url,
    String? text,
    required int time,
  }) : super(
          id: id,
          by: by,
          title: title,
          score: score,
          kids: kids,
          url: url,
          text: text,
          time: time,
        );

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(
      id: json['id'],
      by: json['by'],
      title: json['title'],
      score: json['score'],
      kids: json['kids'] ?? [],
      url: json['url'],
      text: json['text'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'by': by,
      'title': title,
      'score': score,
      'kids': kids,
      'url': url,
      'text': text,
      'time': time,
    };
  }
}
