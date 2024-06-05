import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:innvatti/components/logo/logo.dart';
import 'package:video_player/video_player.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  late VideoPlayerController _videoPlayerController2;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  List<String> srcs = [
    "https://assets.mixkit.co/videos/preview/mixkit-spinning-around-the-earth-29351-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-daytime-city-traffic-aerial-view-56-large.mp4",
    "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4"
  ];

  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    _videoPlayerController2 =
        VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    // final subtitles = [
    //     Subtitle(
    //       index: 0,
    //       start: Duration.zero,
    //       end: const Duration(seconds: 10),
    //       text: 'Hello from subtitles',
    //     ),
    //     Subtitle(
    //       index: 0,
    //       start: const Duration(seconds: 10),
    //       end: const Duration(seconds: 20),
    //       text: 'Whats up? :)',
    //     ),
    //   ];

    final subtitles = [
      Subtitle(
        index: 0,
        start: Duration.zero,
        end: const Duration(seconds: 10),
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Hello',
              style: TextStyle(color: Colors.red, fontSize: 22),
            ),
            TextSpan(
              text: ' from ',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            TextSpan(
              text: 'subtitles',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            )
          ],
        ),
      ),
      Subtitle(
        index: 0,
        start: const Duration(seconds: 10),
        end: const Duration(seconds: 20),
        text: 'Whats up? :)',
        // text: const TextSpan(
        //   text: 'Whats up? :)',
        //   style: TextStyle(color: Colors.amber, fontSize: 22, fontStyle: FontStyle.italic),
        // ),
      ),
    ];

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,

      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: toggleVideo,
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      subtitle: Subtitles(subtitles),
      subtitleBuilder: (context, dynamic subtitle) => Container(
        padding: const EdgeInsets.all(10.0),
        child: subtitle is InlineSpan
            ? RichText(
                text: subtitle,
              )
            : Text(
                subtitle.toString(),
                style: const TextStyle(color: Colors.black),
              ),
      ),

      hideControlsTimer: const Duration(seconds: 1),

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  int currPlayIndex = 0;

  Future<void> toggleVideo() async {
    await _videoPlayerController1.pause();
    currPlayIndex += 1;
    if (currPlayIndex >= srcs.length) {
      currPlayIndex = 0;
    }
    await initializePlayer();
  }


  @override
  Widget build(BuildContext context) {
     var d = [
      Container(
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal:50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Quienes somos",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * .02)),
                    Text("Somos un equipo humano con experiencia en la industria logística.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * .014)),
                    Container(
                      margin:EdgeInsets.only(top:40),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(children: [
                              CircleAvatar(radius: 50,),
                              Expanded(child: Container(child: Text("ABC",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .014)),),)
                            ],),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(children: [
                              CircleAvatar(radius: 50,),
                              Expanded(child: Container(child: Text("ABC",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .014)),),)
                            ],),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(children: [
                              CircleAvatar(radius: 50,),
                              Expanded(child: Container(child: Text("ABC",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .014)),),)
                            ],),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(30),
                      child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/bass.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: (MediaQuery.of(context).size.width - 80) * .5,
                          height:
                              (MediaQuery.of(context).size.width - 400) * .5))),
            ],
          )),
      Container(
          child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(30),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          width: (MediaQuery.of(context).size.width - 80) * .5,
                          height:
                              (MediaQuery.of(context).size.width - 0) * .5,child:_chewieController != null &&
                        _chewieController!
                            .videoPlayerController.value.isInitialized
                    ? AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        child: Chewie(
                            controller: _chewieController!,
                          ),
                      ),
                    )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('Loading'),
                        ],
                      )))),
            ],
          )),
           
     ];

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * .1,
                      bottom: MediaQuery.of(context).size.width * .1),
                  child: Logo()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(d.length, (index) {
                    return d[index];
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}