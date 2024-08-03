import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/features/data/datasources/news_api_service.dart';
import 'package:news_app/features/data/repositories/news_repository_impl.dart';
import 'package:news_app/features/domain/repositories/news_repository.dart';
import 'package:news_app/features/domain/usecases/fetch_comments_use_case.dart';
import 'package:news_app/features/domain/usecases/get_top_stories.dart';
import 'package:news_app/features/presentation/controller/home/homeController.dart';
import 'package:news_app/features/presentation/controller/story/story_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<http.Client>(() => http.Client());
    Get.lazyPut<NewsApiService>(
        () => NewsApiServiceImpl(client: Get.find<http.Client>()));
    Get.lazyPut<NewsRepository>(
        () => NewsRepositoryImpl(newsApiService: Get.find<NewsApiService>()));
    Get.lazyPut<GetTopStories>(() => GetTopStories(Get.find<NewsRepository>()));
    Get.lazyPut<HomeController>(
        () => HomeController(getTopStories: Get.find<GetTopStories>()));

    final httpClient = http.Client();
    final commentDataSource = CommentDataSource(httpClient);
    final commentRepository = CommentRepositoryImpl(commentDataSource);
    final fetchCommentsUseCase = FetchCommentsUseCase(commentRepository);

    Get.put(fetchCommentsUseCase);
    Get.put(StoryController(fetchCommentsUseCase));
  }
}
