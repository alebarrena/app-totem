import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innvatti/components/logo/logo.dart';

class CompanyPage extends StatefulWidget {
  static String route = "/company";
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage>
    with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    var d = [
      Container(
          height: MediaQuery.of(context).size.height * .2,
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(child: Column(
                children: [
                  Text("Quienes somos",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .02)),
                  Text("Nuestro desafio",style:TextStyle(color:Colors.black,fontSize:  MediaQuery.of(context).size.height * .01)),
                ],
              )),
              Expanded(child: Image.asset("assets/logo.png")),
            ],
          )),
      Container(
          height: MediaQuery.of(context).size.height * .2,
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(child: Image.asset("assets/logo.png")),
              Expanded(child: Column(
                children: [
                  Text("Nuestro desafio",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .02)),
                  Text("Nuestro desafio",style:TextStyle(color:Colors.black,fontSize:  MediaQuery.of(context).size.height * .01)),
                ],
              )),
            ],
          )),
                  Text("Casos de Exito",style:TextStyle(color:Colors.black,fontSize: MediaQuery.of(context).size.height * .02)),
      Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * .15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                children: [
                  IconButton(
                    splashRadius: 100,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_pageViewController.page == 0) {
                        return;
                      }
                      _pageViewController.animateToPage(
                          _pageViewController.page!.toInt() - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    icon: const Icon(
                      Icons.arrow_left_rounded,
                      size: 100.0,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
                      /// Use [Axis.vertical] to scroll vertically.
                      controller: _pageViewController,
                      onPageChanged: _handlePageViewChanged,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [SizedBox(
        child: CircleAvatar(
          radius: 40.0,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12.0,
                child: Icon(
                  Icons.camera_alt,
                  size: 15.0,
                  color: Color(0xFF404040),
                ),
              ),
            ),
            radius: 38.0,
            backgroundImage: AssetImage(
              'assets/logo.png'),
          ),
        ),
      ),
                              Expanded(
                                child: Container(
                                  child: Text('Caso 1', style: textTheme.titleLarge),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Text('Caso 1', style: textTheme.titleLarge),
                        ),
                        Center(
                          child: Text('Caso 1', style: textTheme.titleLarge),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    splashRadius: 100.0,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (_pageViewController.page == 2.0) {
                        return;
                      }
                      _pageViewController.animateToPage(
                          _pageViewController.page!.toInt() + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    icon: const Icon(
                      Icons.arrow_right_rounded,
                      size: 100.0,
                    ),
                  ),
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
    ];

    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * .1),
                  child: Logo()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(d.length,(index){
                    return d[index];
                  }),
                ),
              ),
            ],
          ),     
            Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Container(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * .1),
                            child: TextButton(
                                onPressed: () {
                                },
                                child: (true)?Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF304c9c), width: 5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("<< Volver",
                                        style:
                                            TextStyle(color: Color(0xFF304c9c)))):Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 5),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Text("<< Volver",
                                        style:
                                            TextStyle(color: Colors.white)))),
                          ),
                        ),
                      )),
       
        ],
      ),
    );
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
}

/// Page indicator for desktop and web platforms.
///
/// On Desktop and Web, drag gesture for horizontal scrolling in a PageView is disabled by default.
/// You can defined a custom scroll behavior to activate drag gestures,
/// see https://docs.flutter.dev/release/breaking-changes/default-scroll-behavior-drag.
///
/// In this sample, we use a TabPageSelector to navigate between pages,
/// in order to build natural behavior similar to other desktop applications.
class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new DotsIndicator(
            dotsCount: tabController.length,
            position: tabController.index,
            decorator: DotsDecorator(
              size: const Size(100.0, 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeSize: const Size(100.0, 10.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
            ),
          )
          /*TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
            borderStyle: BorderStyle.none,
            indicatorSize: 100,
          ),*/
        ],
      ),
    );
  }
}
