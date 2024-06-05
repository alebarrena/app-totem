import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:innvatti/components/logo/logo.dart';

class CompanyScreen extends StatefulWidget {
  static String route = "/company";
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen>
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
                    Text("Somos un equipo humano con experiencia en la industria logística. Nos apasionamos en generar innovación disruptiva para la industria logística de forma creatividad y con agilidad",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * .012)),
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
                              image: DecorationImage(
                                  image: AssetImage("assets/bass.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20)),
                          width: (MediaQuery.of(context).size.width - 80) * .5,
                          height:
                              (MediaQuery.of(context).size.width - 400) * .5))),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nuestro desafio",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * .02)),
                    Text("Ser el partner tecnológico de nuestros clientes, con una fuerte relación a largo plazo. Nuestro desafio es apoyar a nuestros partners en soluciones que contribuyan a dar valor a su negocio.",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize:
                                MediaQuery.of(context).size.height * .012)),
                  ],
                ),
              )),
            ],
          )),
      Container(
          padding: EdgeInsets.all(50),
          width: double.infinity,
          child: Text("Casos de Exito",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.height * .02))),
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
                            children: [
                              SizedBox(
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 80.0,
                                    backgroundImage:
                                        AssetImage('assets/logo.png'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:40),),
                                    ),
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:30),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 80.0,
                                    backgroundImage:
                                        AssetImage('assets/logo.png'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:40),),
                                    ),
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:30),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 80.0,
                                    backgroundImage:
                                        AssetImage('assets/logo.png'),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:40),),
                                    ),
                                    Container(
                                      child: Text('Caso 1',style: TextStyle(color:Colors.black,fontSize:30),),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                      top: MediaQuery.of(context).size.width * .1),
                  child: Logo()),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
              size: const Size(100.0, 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              activeSize: const Size(100.0, 20.0),
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
