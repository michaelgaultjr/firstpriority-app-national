import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/resources/resources_controller.dart';
import 'package:first_priority_app/models/resource.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatelessWidget {
  final ResourcesController _resourcesController =
      Get.put(ResourcesController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Resource>>(
      future: _resourcesController.get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.length,
          itemBuilder: (BuildContext ctx, int index) {
            return resourceWidget(snapshot.data[index]);
          },
        );
      },
    );
  }

  GestureDetector resourceWidget(Resource resource) {
    return GestureDetector(
      child: Card(
        elevation: 2,
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image(
          image: CachedNetworkImageProvider(resource.imageUrl),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.all(4),
      ),
      onTap: () => launch(resource.url),
    );
  }
}
