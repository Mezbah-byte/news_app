class Story {
  final int id;
  final String by;
  final String title;
  final int score;
  final List<dynamic> kids;
  final String? url;
  final String? text;
  final int time;

  Story({
    required this.id,
    required this.by,
    required this.title,
    required this.score,
    required this.kids,
    this.url,
    this.text,
    required this.time,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
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
}
