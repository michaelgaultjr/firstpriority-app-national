import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../Constants.dart';

class EventsDetails extends StatefulWidget {
  EventsDetails({Key key}) : super(key: key);

  @override
  _EventsDetailsState createState() => _EventsDetailsState();
}

class _EventsDetailsState extends State<EventsDetails> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              'MONDAY, SEPTEMBER 27',
              style: getCustomTextProperties(Colors.black54, 16, "Schyler", 1),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Weekly Meeting: \nEquip',
              style: getCustomTextProperties(Colors.black, 30, "Schyler", 1),
            ),
          ),
          Center(
            child: Container(
              color: Colors.black,
              height: 232,
              margin: EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the VideoPlayerController has finished initialization, use
                        // the data it provides to limit the aspect ratio of the video.
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          // Use the VideoPlayer widget to display the video.
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        // If the VideoPlayerController is still initializing, show a
                        // loading spinner.
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  Center(
                    child: FloatingActionButton(
                      onPressed: () {
                        // Wrap the play or pause in a call to `setState`. This ensures the
                        // correct icon is shown.
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      // Display the correct icon depending on the state of the player.
                      child: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(10),
              child: Text(
                'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set'
                'Orci Verb set neculer static road heat set',
                style: getCustomTextProperties(
                    colorEventDetailText, 15, "Schyler", 2),
              ))
        ]);
  }

  @override
  void initState() {
    // Create an store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }
}
