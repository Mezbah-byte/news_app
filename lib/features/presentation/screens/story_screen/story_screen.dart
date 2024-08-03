import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/features/domain/entities/comment.dart';
import 'package:news_app/features/domain/entities/story.dart';
import 'package:news_app/features/presentation/controller/story/story_controller.dart';
import 'package:news_app/utils/appColor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart'; // Add this for better date formatting

class StoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final story = Get.arguments as Story;
    final StoryController controller = Get.find();

    final commentIds = (story.kids ?? []).map((e) => e as int).toList();
    controller.loadComments(commentIds);

    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/image/hacker.jpg',
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 15,
            ),
            Text(
              story.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            if (story.url != null)
              InkWell(
                child: Text(
                  story.url!,
                  style: const TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
                onTap: () => _launchURL(story.url!),
              )
            else
              Text(story.text ?? ''),
            const SizedBox(height: 10),
            Text('By: ${story.by}'),
            Text(
                'Time: ${DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(story.time * 1000))}'),
            Text('Upvotes: ${story.score}'),
            Text('Comments: ${story.kids?.length ?? 0}'),
            const SizedBox(height: 10),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.errorMessage.isNotEmpty) {
                return Center(child: Text(controller.errorMessage.value));
              } else if (controller.comments.isEmpty) {
                return const Center(child: Text('No comments found'));
              } else {
                final comments = controller.comments;
                return Expanded(
                  child: ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return ListTile(
                        title: Text(
                          '${comment.by} : ',
                          style: const TextStyle(
                              color: ColorResources.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(comment.text ?? 'No text available'),
                      );
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }
}
