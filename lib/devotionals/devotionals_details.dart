import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/models/devotional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DevotionalsDetailsScreen extends StatelessWidget {
  final Devotional devotional;

  DevotionalsDetailsScreen({this.devotional});

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
                  child: Image(
                    width: Get.width,
                    height: Get.height / 3,
                    image: CachedNetworkImageProvider(devotional.imageUrl),
                    fit: BoxFit.cover,
                  ),
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
}
