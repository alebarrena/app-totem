import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:innvatti/components/large-button/largebutton_component.dart';
import 'package:innvatti/components/logo/logo.dart';
import 'package:innvatti/features/screen/screen.dart';
import 'package:video_player/video_player.dart';

class Layout extends StatefulWidget {
  final Widget initialWidget;
  final bool screenSaver;
  const Layout({
    super.key,
    required this.initialWidget,
    required this.screenSaver
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
    screenSaver = widget.screenSaver;
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
        backgroundColor: Color(0xFF243c9c),
        body: (screenSaver)
            ? Container(child: ScreenSaver(callback: () {
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
              }))
            : Stack(
                children: [
                  Container(child: widget.initialWidget),
                  
                ],
              ));
  }
}

class ScreenSaver extends StatefulWidget {
  final Function callback;
  const ScreenSaver({super.key, required this.callback});

  @override
  State<ScreenSaver> createState() => _ScreenSaverState();
}

class _ScreenSaverState extends State<ScreenSaver> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        "assets/intro.mp4"); //VideoPlayerController.file(File("C:\\Users\\USUARIO\\Documents\\app-totem\\assets\\intro.mp4")):
    _controller.initialize().then((value) {
      if (_controller.value.isInitialized) {
        _controller.setLooping(true);
        _controller.setVolume(0.0);
        _controller.play();
        print("vIDEO INIt");
        setState(() {});
      } else {
        print("video file load failed");
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
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Container(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * .1),
                        child: Logo())))),

        Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                  child: TextButton(
                      onPressed: () {
                        widget.callback();
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 5),
                              borderRadius: BorderRadius.circular(30)),
                          child: Text("Iniciar",
                              style: TextStyle(color: Colors.white)))),
                ),
              ),
            )),
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
