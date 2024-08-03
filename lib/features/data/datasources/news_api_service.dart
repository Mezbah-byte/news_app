import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/features/domain/entities/comment.dart';
abstract class NewsApiService {
  Future<List<int>> fetchTopStoryIds();
  Future<Map<String, dynamic>> fetchStory(int id);
}

class NewsApiServiceImpl implements NewsApiService {
  final http.Client client;

  NewsApiServiceImpl({required this.client});

  @override
  Future<List<int>> fetchTopStoryIds() async {
    final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/topstories.json'));
    if (response.statusCode == 200) {
      return List<int>.from(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> fetchStory(int id) async {
    final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$id.json'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ServerException();
    }
  }
}


class CommentDataSource {
  final http.Client client;

  CommentDataSource(this.client);

  Future<Comment> fetchComment(int commentId) async {
    final response = await client.get(Uri.parse('https://hacker-news.firebaseio.com/v0/item/$commentId.json?print=pretty'));
    if (response.statusCode == 200) {
      return Comment.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load comment');
    }
  }
}