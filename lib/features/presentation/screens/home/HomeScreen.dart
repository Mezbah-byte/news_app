import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/config/routes.dart';
import 'package:news_app/features/presentation/controller/home/homeController.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Stories'),
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.stories.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (!controller.isPaginationLoading.value &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.fetchTopStories(
                  page: controller.currentPage + 1,
                  pageSize: controller.pageSize);
            }
            return false;
          },
          child: RefreshIndicator(
            onRefresh: () async {
              controller.refreshStories();
            },
            child: ListView.builder(
              itemCount: controller.stories.length + 1,
              itemBuilder: (context, index) {
                if (index < controller.stories.length) {
                  final story = controller.stories[index];
                  return ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/image/hacker.jpg')),
                    title: Text(story.title ?? 'No title'),
                    subtitle: Text(
                        'Upvotes: ${story.score} | Comments: ${story.kids?.length ?? 0}'),
                    onTap: () {
                      Get.toNamed('/story', arguments: story);
                    },
                  );
                } else {
                  return controller.isPaginationLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox.shrink();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
