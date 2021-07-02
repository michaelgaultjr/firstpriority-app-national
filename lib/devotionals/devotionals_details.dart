import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:first_priority_app/widgets/back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class DevotionalsDetailsScreen extends StatefulWidget {
  final Devotional devotional;

  DevotionalsDetailsScreen({this.devotional});

  @override
  _DevotionalsDetailsScreenState createState() =>
      _DevotionalsDetailsScreenState();
}

class _DevotionalsDetailsScreenState extends State<DevotionalsDetailsScreen> {
  VideoPlayerController _videoController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.devotional.videoUrl)
      ..initialize().then((_) => setState(() {
            _chewieController =
                ChewieController(videoPlayerController: _videoController);
          }));
  }

  @override
  void dispose() {
    super.dispose();
    _videoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: widget.devotional.title,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                elevation: 5,
                child: _buildMediaWidget(),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(widget.devotional.description),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMediaWidget() {
    if (_videoController.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: Chewie(
          controller: _chewieController,
        ),
      );
    }

    return Image(
      width: Get.width,
      height: Get.height / 3,
      image: CachedNetworkImageProvider(widget.devotional.imageUrl),
      fit: BoxFit.cover,
    );
  }
}
