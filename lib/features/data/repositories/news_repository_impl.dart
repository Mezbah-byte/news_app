import 'package:news_app/core/error/exceptions.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:news_app/features/data/datasources/news_api_service.dart';
import 'package:news_app/features/data/model/story_model.dart';
import 'package:news_app/features/domain/entities/comment.dart';
import 'package:news_app/features/domain/entities/story.dart';
import 'package:news_app/features/domain/repositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService newsApiService;

  NewsRepositoryImpl({required this.newsApiService});

  @override
  Future<Either<Failure, List<Story>>> getTopStories({int page = 0, int pageSize = 10}) async {
    try {
      final ids = await newsApiService.fetchTopStoryIds();
      final startIndex = page * pageSize;
      final endIndex = startIndex + pageSize;
      final limitedIds = ids.sublist(startIndex, endIndex > ids.length ? ids.length : endIndex);

      final stories = await Future.wait(
        limitedIds.map((id) async {
          final storyJson = await newsApiService.fetchStory(id);
          return StoryModel.fromJson(storyJson); // Ensure StoryModel is correctly implemented
        }),
      );

      return Right(stories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}


class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource dataSource;

  CommentRepositoryImpl(this.dataSource);

  @override
  Future<List<Comment>> fetchComments(List<int> commentIds) async {
    final comments = <Comment>[];
    for (final commentId in commentIds) {
      final comment = await dataSource.fetchComment(commentId);
      comments.add(comment);
    }
    return comments;
  }
}
