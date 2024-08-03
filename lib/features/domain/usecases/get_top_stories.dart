import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/domain/entities/story.dart';
import 'package:news_app/features/domain/repositories/news_repository.dart';

class GetTopStories implements UseCase<List<Story>, GetTopStoriesParams> {
  final NewsRepository repository;

  GetTopStories(this.repository);

  @override
  Future<Either<Failure, List<Story>>> call(GetTopStoriesParams params) async {
    return await repository.getTopStories(page: params.page, pageSize: params.pageSize);
  }
}

class GetTopStoriesParams {
  final int page;
  final int pageSize;

  GetTopStoriesParams({required this.page, required this.pageSize});
}