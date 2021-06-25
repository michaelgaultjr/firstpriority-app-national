import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DevotionalsDetailsScreen extends StatelessWidget {
  final Devotional devotional;

  DevotionalsDetailsScreen({this.devotional});

  VideoPlayerController _videoController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Material(
                  elevation: 5,
                  child: _buildMediaWidget(),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    devotional.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Divider(),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    devotional.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMediaWidget() {
    if (devotional.videoUrl != null && devotional.videoUrl.isNotEmpty) {
      _videoController = new VideoPlayerController.network(devotional.videoUrl);
      return VideoPlayer(_videoController);
    }

    return Image(
      width: Get.width,
      height: Get.height / 3,
      image: CachedNetworkImageProvider(devotional.imageUrl),
      fit: BoxFit.cover,
    );
  }
}
