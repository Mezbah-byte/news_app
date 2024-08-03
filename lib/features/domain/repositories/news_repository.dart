import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/domain/entities/comment.dart';
import 'package:news_app/features/domain/entities/story.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<Story>>> getTopStories({int page = 0, int pageSize = 10});
}

abstract class CommentRepository {
  Future<List<Comment>> fetchComments(List<int> commentIds);
}
