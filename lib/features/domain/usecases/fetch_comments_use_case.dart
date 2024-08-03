import 'package:news_app/features/domain/entities/comment.dart';
import 'package:news_app/features/domain/repositories/news_repository.dart';

class FetchCommentsUseCase {
  final CommentRepository repository;

  FetchCommentsUseCase(this.repository);

  Future<List<Comment>> execute(List<int> commentIds) {
    return repository.fetchComments(commentIds);
  }
}
