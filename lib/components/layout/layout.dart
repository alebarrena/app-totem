import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Layout extends StatefulWidget {
  final Widget initialWidget;
  const Layout({
    super.key,
    required this.initialWidget,
  });

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late Timer _timer;
  late bool screenSaver;
  @override
  void initState() {
    super.initState();
    screenSaver = false;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        screenSaver = true;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: (screenSaver)
            ? GestureDetector(
                onTap: () {
                  _timer.cancel();
                  _timer = Timer(const Duration(seconds: 5), () {
                    setState(() {
                      screenSaver = true;
                    });
                  });
                  setState(() {
                    screenSaver = false;
                  });
                  print(screenSaver);
                },
                child: ScreenSaver())
            : Container(color: Colors.blue));
  }
}

class ScreenSaver extends StatefulWidget {
  const ScreenSaver({super.key});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File("C:\\Users\\USUARIO\\Documents\\app-totem\\assets\\intro.mp4"));
    _controller.initialize().then((value) {
      if (_controller.value.isInitialized) {
    _controller.setLooping(true);
    _controller.setVolume(0.0);
        _controller.play();
        setState(() {});
      } else {
        //log("video file load failed");
      }
    });
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              //FURTHER IMPLEMENTATION
            ],
          );
    /*return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size?.width ?? 0,
                    height: _controller.value.size?.height ?? 0,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              //FURTHER IMPLEMENTATION
            ],
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );*/
  }
}
