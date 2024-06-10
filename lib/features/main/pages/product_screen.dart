import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innvatti/components/logo/logo.dart';
import 'package:innvatti/features/screen/pages/company_page.dart';
import 'package:innvatti/shared/assets_dir.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoContainer extends StatefulWidget {
  final String src;
  const VideoContainer({super.key,required String this.src});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =AssetsDir.video("intro.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.isInitialized
          ? Stack(
              children: [
                Container(
  clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                child: VideoPlayer(_controller),
                              ),
                            ),
                          ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(color:(_controller.value.isPlaying)?Colors.black.withOpacity(.0):Colors.black.withOpacity(.3),borderRadius: BorderRadius.circular(20)),
                    width:double.infinity,
                    height: double.infinity,
                    child:(!(_controller.value.isPlaying))? Center(child: Icon(Icons.play_circle_outline,color:Colors.white,size:MediaQuery.of(context).size.width*.1),):Container(),
                  ),
                )
              ],
            )
          : Container(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  final dynamic product;
  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;
  TargetPlatform? _platform;
  late VideoPlayerController _videoPlayerController1;
  ChewieController? _chewieController;
  int? bufferDelay;
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: widget.product['videos'].length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
/*
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController?.dispose();
    super.dispose();
  }


  Future<void> initializePlayer() async {
    _videoPlayerController1 =
        VideoPlayerController.networkUrl(Uri.parse(srcs[currPlayIndex]));
    await Future.wait([
      _videoPlayerController1.initialize()
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
*/

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFEEECEC),
      child: Stack(
        children: [
          Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Image.asset("assets/bg-vector2.png"))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * .1,
                        bottom: MediaQuery.of(context).size.width * .1),
                    child: Container(
                        width: MediaQuery.of(context).size.width * .3,
                        child: Image.asset("assets/logo2.png"))),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.product['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .02)),
                                Text(widget.product['description'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                .014)),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                      children: List.generate(
                                          widget.product['features'].length,
                                          (index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              radius: (MediaQuery.of(context)
                                                          .size
                                                          .width -
                                                      80) *
                                                  .03,
                                              backgroundColor:
                                                  Color(0xFF243c9c),
                                              child: Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                      border: Border.all(
                                                        color: Colors.white,
                                                      )),
                                                  child: Icon(Icons.check,
                                                      color: Colors.white))),
                                          Expanded(
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Text(
                                                  widget.product['features']
                                                      [index],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              .014)),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  })),
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
                                              image: AssetImage(
                                                  widget.product['image']),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width:
                                          (MediaQuery.of(context).size.width -
                                                  80) *
                                              .5,
                                      height:
                                          (MediaQuery.of(context).size.width -
                                                  400) *
                                              .5))),
                        ],
                      )),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * .05),
                        height: MediaQuery.of(context).size.height * .25,
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Center(
                                      child: IconButton(
                                          onPressed: () {
                                            this
                                                ._pageViewController
                                                .previousPage(
                                                    duration: Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.linear);
                                          },
                                          icon: Icon(Icons.chevron_left,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1))),
                                  Expanded(
                                    child: PageView(
                                      controller: _pageViewController,
                                      onPageChanged: _handlePageViewChanged,
                                      children: List.generate(widget.product['videos'].length, (index){
                                        return  VideoContainer(src:widget.product['videos'][index],);
                                      })
                                    ),
                                  ),
                                  Center(
                                      child: IconButton(
                                          onPressed: () {
                                            this._pageViewController.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.linear);
                                          },
                                          icon: Icon(Icons.chevron_right,
                                              size: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .1))),
                                ],
                              ),
                            ),
                            PageIndicator(
                              tabController: _tabController,
                              currentPageIndex: _currentPageIndex,
                              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
                              isOnDesktopAndWeb: _isOnDesktopAndWeb,
                            ),
                          ],
                        ),
                      ),

                      /*Container(
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
          )),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
