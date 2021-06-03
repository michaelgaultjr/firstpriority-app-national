import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constants.dart';

class DevotionalsDetailsScreen extends StatelessWidget {
  final Devotional devotional;

  DevotionalsDetailsScreen({this.devotional});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  width: Get.width,
                  height: Get.height / 3,
                  image: CachedNetworkImageProvider(devotional.contentUrl),
                  fit: BoxFit.cover),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  devotional.title,
                  style: getCustomTextProperties(
                      Colors.black, 30, fontSchylerRegular, 1),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  devotional.description,
                  style: getCustomTextProperties(
                      colorEventDetailText, 15, fontSchylerRegular, 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
