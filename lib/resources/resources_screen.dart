import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_priority_app/Constants.dart';
import 'package:first_priority_app/resources/controllers/resources_controller.dart';
import 'package:first_priority_app/models/resource.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ResourcesScreen extends StatelessWidget {
  final ResourcesController _resourcesController =
      Get.put(ResourcesController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 60.0,
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            'Resources',
            style: getCustomTextProperties(
                Colors.black, 30, fontSchylerRegular, 1),
          ),
        ),
        FutureBuilder<List<Resource>>(
          future: _resourcesController.get(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 8),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return resourceWidget(snapshot.data[index]);
                  },
                ),
              ),
            );
          },
        )
      ],
    );
  }

  GestureDetector resourceWidget(Resource resource) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: CachedNetworkImageProvider(resource.imageUrl),
          ),
        ),
      ),
      onTap: () => launch(resource.url),
    );
  }
}
