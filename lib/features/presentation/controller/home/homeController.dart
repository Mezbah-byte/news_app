import 'package:get/get.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/domain/entities/story.dart';
import 'package:news_app/features/domain/usecases/get_top_stories.dart';

class HomeController extends GetxController {
  final GetTopStories getTopStories;

  HomeController({required this.getTopStories});

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchTopStories();
  }

  var stories = <Story>[].obs;
  var isLoading = false.obs;
  var isPaginationLoading = false.obs;
  var errorMessage = ''.obs;
  var currentPage = 0;
  var pageSize = 10;

  void fetchTopStories({int page = 0, int pageSize = 10}) async {
    if (page == 0) {
      isLoading.value = true;
    } else {
      isPaginationLoading.value = true;
    }

    final result = await getTopStories(GetTopStoriesParams(page: page, pageSize: pageSize));
    result.fold(
      (failure) {
        errorMessage.value = _mapFailureToMessage(failure);
      },
      (storyList) {
        if (page == 0) {
          stories.value = storyList;
        } else {
          stories.addAll(storyList);
        }
        currentPage = page;
      },
    );

    isLoading.value = false;
    isPaginationLoading.value = false;
  }

  
  void refreshStories() async {
    fetchTopStories(page: 0, pageSize: pageSize);
  }

  String _mapFailureToMessage(Failure failure) {
    return "An error occurred";
  }
}