import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants.dart';

class DevotionalsDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 60.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                  width: Get.width,
                  height: Get.height / 3,
                  image: AssetImage('assets/images/home_card.jpg'),
                  fit: BoxFit.fill),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Build Intentional Friendships in the New School Year',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                      decoration: TextDecoration.none),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  'Orci viverra ad cras dapibus sagittis vitae nisi nulla tempus, ligula nascetur cubilia adipiscing in justo varius dignissim ipsum venenatis, erat sed metus quisque cursus felis risus natoque. Urna semper ante augue convallis vitae interdum hac id nascetur, habitant hendrerit euismod parturient fusce auctor facilisis. Justo urna scelerisque ante nisl taciti ipsum volutpat, facilisi proin mattis dui tortor ultrices, maecenas tincidunt neque libero integer vel. Curabitur quis iaculis convallis mauris duis lectus diam montes neque, posuere consectetur parturient felis vitae ligula pulvinar et proin venenatis, maecenas dictum euismod a viverra torquent condimentum donec. Tristique quisque curabitur ultricies porttitor eros dictum mattis, auctor quis pretium class posuere montes, lorem ligula feugiat vestibulum velit tellus. Himenaeos porta ut quisque etiam elit sem sollicitudin maecenas orci, vehicula urna morbi libero augue ac leo erat, sed nascetur nullam ullamcorper porttitor sociis tristique hac.',
                  style: getCustomTextProperties(colorEventDetailText, 15, "Schyler", 2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
