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
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image(
                    width: Get.width,
                    height: Get.height / 3,
                    image: CachedNetworkImageProvider(devotional.imageUrl),
                    fit: BoxFit.cover),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    devotional.title,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                Divider(),
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
