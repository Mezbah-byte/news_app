import 'package:get/get.dart';
import 'package:news_app/features/domain/entities/comment.dart';
import 'package:news_app/features/domain/usecases/fetch_comments_use_case.dart';

class StoryController extends GetxController {
  final FetchCommentsUseCase fetchCommentsUseCase;

  StoryController(this.fetchCommentsUseCase);

  RxList<Comment> comments = <Comment>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  Future<void> loadComments(List<int> commentIds) async {
    try {
      isLoading.value = true;
      final fetchedComments = await fetchCommentsUseCase.execute(commentIds);
      comments.value = fetchedComments;
    } catch (e) {
      errorMessage.value = 'Error loading comments';
    } finally {
      isLoading.value = false;
    }
  }
}
